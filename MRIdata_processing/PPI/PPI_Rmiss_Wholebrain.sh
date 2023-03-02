#!/bin/bash
#
##################################################
datapath=''
maskpath=''
##################################################


3dttest++ -prefix Rmiss_VS_firsttime \
-mask ${maskpath}/group_GM_mask_70+tlrc.BRIK \
-Clustsim 5 \
-setA fullsample \
sub-003	${datapath}/sub-003sess001/func/sub-003sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-004	${datapath}/sub-004sess001/func/sub-004sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-005	${datapath}/sub-005sess001/func/sub-005sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-006	${datapath}/sub-006sess001/func/sub-006sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-006	${datapath}/sub-006sess002/func/sub-006sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-007	${datapath}/sub-007sess001/func/sub-007sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-008	${datapath}/sub-008sess001/func/sub-008sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-009	${datapath}/sub-009sess001/func/sub-009sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-010	${datapath}/sub-010sess001/func/sub-010sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-011	${datapath}/sub-011sess001/func/sub-011sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-012	${datapath}/sub-012sess001/func/sub-012sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-013	${datapath}/sub-013sess001/func/sub-013sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-015	${datapath}/sub-015sess001/func/sub-015sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-017	${datapath}/sub-017sess001/func/sub-017sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-018	${datapath}/sub-018sess001/func/sub-018sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-019	${datapath}/sub-019sess001/func/sub-019sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-022	${datapath}/sub-022sess001/func/sub-022sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-023	${datapath}/sub-023sess001/func/sub-023sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-024	${datapath}/sub-024sess001/func/sub-024sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-025	${datapath}/sub-025sess001/func/sub-025sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-026	${datapath}/sub-026sess001/func/sub-026sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-027	${datapath}/sub-027sess001/func/sub-027sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-028	${datapath}/sub-028sess001/func/sub-028sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-029	${datapath}/sub-029sess001/func/sub-029sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-030	${datapath}/sub-030sess001/func/sub-030sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-032	${datapath}/sub-032sess001/func/sub-032sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-037	${datapath}/sub-037sess001/func/sub-037sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-038	${datapath}/sub-038sess001/func/sub-038sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-040	${datapath}/sub-040sess001/func/sub-040sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-043	${datapath}/sub-043sess001/func/sub-043sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-044	${datapath}/sub-044sess001/func/sub-044sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-045	${datapath}/sub-045sess001/func/sub-045sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-046	${datapath}/sub-046sess001/func/sub-046sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-047	${datapath}/sub-047sess001/func/sub-047sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-048	${datapath}/sub-048sess001/func/sub-048sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-054	${datapath}/sub-054sess001/func/sub-054sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-055	${datapath}/sub-055sess001/func/sub-055sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-056	${datapath}/sub-056sess001/func/sub-056sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-057	${datapath}/sub-057sess001/func/sub-057sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-058	${datapath}/sub-058sess001/func/sub-058sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-059	${datapath}/sub-059sess001/func/sub-059sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-060	${datapath}/sub-060sess001/func/sub-060sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-061	${datapath}/sub-061sess001/func/sub-061sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-062	${datapath}/sub-062sess002/func/sub-062sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-064	${datapath}/sub-064sess001/func/sub-064sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-065	${datapath}/sub-065sess001/func/sub-065sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-068	${datapath}/sub-068sess001/func/sub-068sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-070	${datapath}/sub-070sess001/func/sub-070sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-071	${datapath}/sub-071sess001/func/sub-071sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-072	${datapath}/sub-072sess001/func/sub-072sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-074	${datapath}/sub-074sess001/func/sub-074sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-075	${datapath}/sub-075sess001/func/sub-075sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-077	${datapath}/sub-077sess001/func/sub-077sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-078	${datapath}/sub-078sess001/func/sub-078sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-080	${datapath}/sub-080sess001/func/sub-080sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-081	${datapath}/sub-081sess001/func/sub-081sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-084	${datapath}/sub-084sess001/func/sub-084sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-085	${datapath}/sub-085sess001/func/sub-085sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-086	${datapath}/sub-086sess001/func/sub-086sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-087	${datapath}/sub-087sess001/func/sub-087sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-088	${datapath}/sub-088sess001/func/sub-088sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-090	${datapath}/sub-090sess001/func/sub-090sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-092	${datapath}/sub-092sess001/func/sub-092sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-093	${datapath}/sub-093sess001/func/sub-093sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-095	${datapath}/sub-095sess001/func/sub-095sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-096	${datapath}/sub-096sess001/func/sub-096sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-097	${datapath}/sub-097sess001/func/sub-097sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-098	${datapath}/sub-098sess001/func/sub-098sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-099	${datapath}/sub-099sess001/func/sub-099sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-102	${datapath}/sub-102sess001/func/sub-102sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-103	${datapath}/sub-103sess001/func/sub-103sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-104	${datapath}/sub-104sess001/func/sub-104sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-106	${datapath}/sub-106sess001/func/sub-106sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-107	${datapath}/sub-107sess001/func/sub-107sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-108	${datapath}/sub-108sess001/func/sub-108sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-110	${datapath}/sub-110sess001/func/sub-110sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-111	${datapath}/sub-111sess001/func/sub-111sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-112	${datapath}/sub-112sess001/func/sub-112sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-114	${datapath}/sub-114sess001/func/sub-114sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-115	${datapath}/sub-115sess001/func/sub-115sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-116	${datapath}/sub-116sess001/func/sub-116sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-117	${datapath}/sub-117sess001/func/sub-117sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-118	${datapath}/sub-118sess001/func/sub-118sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-122	${datapath}/sub-122sess001/func/sub-122sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-123	${datapath}/sub-123sess001/func/sub-123sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-124	${datapath}/sub-124sess001/func/sub-124sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-125	${datapath}/sub-125sess001/func/sub-125sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-126	${datapath}/sub-126sess001/func/sub-126sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-128	${datapath}/sub-128sess001/func/sub-128sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-130	${datapath}/sub-130sess001/func/sub-130sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-131	${datapath}/sub-131sess001/func/sub-131sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-132	${datapath}/sub-132sess001/func/sub-132sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-133	${datapath}/sub-133sess001/func/sub-133sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-134	${datapath}/sub-134sess001/func/sub-134sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-135	${datapath}/sub-135sess001/func/sub-135sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-136	${datapath}/sub-136sess001/func/sub-136sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-137	${datapath}/sub-137sess001/func/sub-137sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-138	${datapath}/sub-138sess001/func/sub-138sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-139	${datapath}/sub-139sess001/func/sub-139sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-140	${datapath}/sub-140sess001/func/sub-140sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-142	${datapath}/sub-142sess001/func/sub-142sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-143	${datapath}/sub-143sess001/func/sub-143sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-144	${datapath}/sub-144sess001/func/sub-144sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-145	${datapath}/sub-145sess001/func/sub-145sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-147	${datapath}/sub-147sess001/func/sub-147sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-148	${datapath}/sub-148sess001/func/sub-148sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-150	${datapath}/sub-150sess001/func/sub-150sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-151	${datapath}/sub-151sess001/func/sub-151sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-153	${datapath}/sub-153sess001/func/sub-153sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-154	${datapath}/sub-154sess001/func/sub-154sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-155	${datapath}/sub-155sess001/func/sub-155sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-156	${datapath}/sub-156sess001/func/sub-156sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-157	${datapath}/sub-157sess001/func/sub-157sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-158	${datapath}/sub-158sess001/func/sub-158sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-160	${datapath}/sub-160sess001/func/sub-160sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-161	${datapath}/sub-161sess001/func/sub-161sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-162	${datapath}/sub-162sess001/func/sub-162sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-163	${datapath}/sub-163sess001/func/sub-163sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-166	${datapath}/sub-166sess001/func/sub-166sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-167	${datapath}/sub-167sess001/func/sub-167sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-170	${datapath}/sub-170sess001/func/sub-170sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-172	${datapath}/sub-172sess001/func/sub-172sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-173	${datapath}/sub-173sess001/func/sub-173sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-175	${datapath}/sub-175sess001/func/sub-175sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-176	${datapath}/sub-176sess001/func/sub-176sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-182	${datapath}/sub-182sess001/func/sub-182sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-184	${datapath}/sub-184sess001/func/sub-184sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-185	${datapath}/sub-185sess001/func/sub-185sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-186	${datapath}/sub-186sess001/func/sub-186sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-187	${datapath}/sub-187sess001/func/sub-187sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-188	${datapath}/sub-188sess001/func/sub-188sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-189	${datapath}/sub-189sess001/func/sub-189sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-190	${datapath}/sub-190sess001/func/sub-190sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-191	${datapath}/sub-191sess001/func/sub-191sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-192	${datapath}/sub-192sess001/func/sub-192sess001-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-193	${datapath}/sub-193sess002/func/sub-193sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-194	${datapath}/sub-194sess002/func/sub-194sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-196	${datapath}/sub-196sess002/func/sub-196sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-197	${datapath}/sub-197sess002/func/sub-197sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-198	${datapath}/sub-198sess002/func/sub-198sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-199	${datapath}/sub-199sess002/func/sub-199sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-200	${datapath}/sub-200sess002/func/sub-200sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-201	${datapath}/sub-201sess002/func/sub-201sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-203	${datapath}/sub-203sess002/func/sub-203sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-204	${datapath}/sub-204sess002/func/sub-204sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-206	${datapath}/sub-206sess002/func/sub-206sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-207	${datapath}/sub-207sess002/func/sub-207sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-208	${datapath}/sub-208sess002/func/sub-208sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-209	${datapath}/sub-209sess002/func/sub-209sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-210	${datapath}/sub-210sess002/func/sub-210sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-211	${datapath}/sub-211sess002/func/sub-211sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-212	${datapath}/sub-212sess002/func/sub-212sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-213	${datapath}/sub-213sess002/func/sub-213sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-214	${datapath}/sub-214sess002/func/sub-214sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-215	${datapath}/sub-215sess002/func/sub-215sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-216	${datapath}/sub-216sess002/func/sub-216sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-217	${datapath}/sub-217sess002/func/sub-217sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-218	${datapath}/sub-218sess002/func/sub-218sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-219	${datapath}/sub-219sess002/func/sub-219sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-220	${datapath}/sub-220sess002/func/sub-220sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-221	${datapath}/sub-221sess002/func/sub-221sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-222	${datapath}/sub-222sess002/func/sub-222sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-226	${datapath}/sub-226sess003/func/sub-226sess003-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-228	${datapath}/sub-228sess002/func/sub-228sess002-SID-PPI-VS-REML+tlrc.BRIK[35] \
sub-999	${datapath}/sub-999sess001/func/sub-999sess001-SID-PPI-VS-REML+tlrc.BRIK[35]



3dttest++ -prefix Rmiss_HB_firsttime \
-mask ${maskpath}/group_GM_mask_70+tlrc.BRIK \
-Clustsim 5 \
-setA fullsample \
sub-003	${datapath}/sub-003sess001/func/sub-003sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-004	${datapath}/sub-004sess001/func/sub-004sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-005	${datapath}/sub-005sess001/func/sub-005sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-006	${datapath}/sub-006sess001/func/sub-006sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-006	${datapath}/sub-006sess002/func/sub-006sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-007	${datapath}/sub-007sess001/func/sub-007sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-008	${datapath}/sub-008sess001/func/sub-008sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-009	${datapath}/sub-009sess001/func/sub-009sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-010	${datapath}/sub-010sess001/func/sub-010sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-011	${datapath}/sub-011sess001/func/sub-011sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-012	${datapath}/sub-012sess001/func/sub-012sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-013	${datapath}/sub-013sess001/func/sub-013sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-015	${datapath}/sub-015sess001/func/sub-015sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-017	${datapath}/sub-017sess001/func/sub-017sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-018	${datapath}/sub-018sess001/func/sub-018sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-019	${datapath}/sub-019sess001/func/sub-019sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-022	${datapath}/sub-022sess001/func/sub-022sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-023	${datapath}/sub-023sess001/func/sub-023sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-024	${datapath}/sub-024sess001/func/sub-024sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-025	${datapath}/sub-025sess001/func/sub-025sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-026	${datapath}/sub-026sess001/func/sub-026sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-027	${datapath}/sub-027sess001/func/sub-027sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-028	${datapath}/sub-028sess001/func/sub-028sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-029	${datapath}/sub-029sess001/func/sub-029sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-030	${datapath}/sub-030sess001/func/sub-030sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-032	${datapath}/sub-032sess001/func/sub-032sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-037	${datapath}/sub-037sess001/func/sub-037sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-038	${datapath}/sub-038sess001/func/sub-038sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-040	${datapath}/sub-040sess001/func/sub-040sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-043	${datapath}/sub-043sess001/func/sub-043sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-044	${datapath}/sub-044sess001/func/sub-044sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-045	${datapath}/sub-045sess001/func/sub-045sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-046	${datapath}/sub-046sess001/func/sub-046sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-047	${datapath}/sub-047sess001/func/sub-047sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-048	${datapath}/sub-048sess001/func/sub-048sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-054	${datapath}/sub-054sess001/func/sub-054sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-055	${datapath}/sub-055sess001/func/sub-055sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-056	${datapath}/sub-056sess001/func/sub-056sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-057	${datapath}/sub-057sess001/func/sub-057sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-058	${datapath}/sub-058sess001/func/sub-058sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-059	${datapath}/sub-059sess001/func/sub-059sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-060	${datapath}/sub-060sess001/func/sub-060sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-061	${datapath}/sub-061sess001/func/sub-061sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-062	${datapath}/sub-062sess002/func/sub-062sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-064	${datapath}/sub-064sess001/func/sub-064sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-065	${datapath}/sub-065sess001/func/sub-065sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-068	${datapath}/sub-068sess001/func/sub-068sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-070	${datapath}/sub-070sess001/func/sub-070sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-071	${datapath}/sub-071sess001/func/sub-071sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-072	${datapath}/sub-072sess001/func/sub-072sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-074	${datapath}/sub-074sess001/func/sub-074sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-075	${datapath}/sub-075sess001/func/sub-075sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-077	${datapath}/sub-077sess001/func/sub-077sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-078	${datapath}/sub-078sess001/func/sub-078sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-080	${datapath}/sub-080sess001/func/sub-080sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-081	${datapath}/sub-081sess001/func/sub-081sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-084	${datapath}/sub-084sess001/func/sub-084sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-085	${datapath}/sub-085sess001/func/sub-085sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-086	${datapath}/sub-086sess001/func/sub-086sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-087	${datapath}/sub-087sess001/func/sub-087sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-088	${datapath}/sub-088sess001/func/sub-088sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-090	${datapath}/sub-090sess001/func/sub-090sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-092	${datapath}/sub-092sess001/func/sub-092sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-093	${datapath}/sub-093sess001/func/sub-093sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-095	${datapath}/sub-095sess001/func/sub-095sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-096	${datapath}/sub-096sess001/func/sub-096sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-097	${datapath}/sub-097sess001/func/sub-097sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-098	${datapath}/sub-098sess001/func/sub-098sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-099	${datapath}/sub-099sess001/func/sub-099sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-102	${datapath}/sub-102sess001/func/sub-102sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-103	${datapath}/sub-103sess001/func/sub-103sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-104	${datapath}/sub-104sess001/func/sub-104sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-106	${datapath}/sub-106sess001/func/sub-106sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-107	${datapath}/sub-107sess001/func/sub-107sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-108	${datapath}/sub-108sess001/func/sub-108sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-110	${datapath}/sub-110sess001/func/sub-110sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-111	${datapath}/sub-111sess001/func/sub-111sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-112	${datapath}/sub-112sess001/func/sub-112sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-114	${datapath}/sub-114sess001/func/sub-114sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-115	${datapath}/sub-115sess001/func/sub-115sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-116	${datapath}/sub-116sess001/func/sub-116sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-117	${datapath}/sub-117sess001/func/sub-117sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-118	${datapath}/sub-118sess001/func/sub-118sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-122	${datapath}/sub-122sess001/func/sub-122sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-123	${datapath}/sub-123sess001/func/sub-123sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-124	${datapath}/sub-124sess001/func/sub-124sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-125	${datapath}/sub-125sess001/func/sub-125sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-126	${datapath}/sub-126sess001/func/sub-126sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-128	${datapath}/sub-128sess001/func/sub-128sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-130	${datapath}/sub-130sess001/func/sub-130sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-131	${datapath}/sub-131sess001/func/sub-131sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-132	${datapath}/sub-132sess001/func/sub-132sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-133	${datapath}/sub-133sess001/func/sub-133sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-134	${datapath}/sub-134sess001/func/sub-134sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-135	${datapath}/sub-135sess001/func/sub-135sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-136	${datapath}/sub-136sess001/func/sub-136sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-137	${datapath}/sub-137sess001/func/sub-137sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-138	${datapath}/sub-138sess001/func/sub-138sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-139	${datapath}/sub-139sess001/func/sub-139sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-140	${datapath}/sub-140sess001/func/sub-140sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-142	${datapath}/sub-142sess001/func/sub-142sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-143	${datapath}/sub-143sess001/func/sub-143sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-144	${datapath}/sub-144sess001/func/sub-144sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-145	${datapath}/sub-145sess001/func/sub-145sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-147	${datapath}/sub-147sess001/func/sub-147sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-148	${datapath}/sub-148sess001/func/sub-148sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-150	${datapath}/sub-150sess001/func/sub-150sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-151	${datapath}/sub-151sess001/func/sub-151sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-153	${datapath}/sub-153sess001/func/sub-153sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-154	${datapath}/sub-154sess001/func/sub-154sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-155	${datapath}/sub-155sess001/func/sub-155sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-156	${datapath}/sub-156sess001/func/sub-156sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-157	${datapath}/sub-157sess001/func/sub-157sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-158	${datapath}/sub-158sess001/func/sub-158sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-160	${datapath}/sub-160sess001/func/sub-160sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-161	${datapath}/sub-161sess001/func/sub-161sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-162	${datapath}/sub-162sess001/func/sub-162sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-163	${datapath}/sub-163sess001/func/sub-163sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-166	${datapath}/sub-166sess001/func/sub-166sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-167	${datapath}/sub-167sess001/func/sub-167sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-170	${datapath}/sub-170sess001/func/sub-170sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-172	${datapath}/sub-172sess001/func/sub-172sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-173	${datapath}/sub-173sess001/func/sub-173sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-175	${datapath}/sub-175sess001/func/sub-175sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-176	${datapath}/sub-176sess001/func/sub-176sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-182	${datapath}/sub-182sess001/func/sub-182sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-184	${datapath}/sub-184sess001/func/sub-184sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-185	${datapath}/sub-185sess001/func/sub-185sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-186	${datapath}/sub-186sess001/func/sub-186sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-187	${datapath}/sub-187sess001/func/sub-187sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-188	${datapath}/sub-188sess001/func/sub-188sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-189	${datapath}/sub-189sess001/func/sub-189sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-190	${datapath}/sub-190sess001/func/sub-190sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-191	${datapath}/sub-191sess001/func/sub-191sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-192	${datapath}/sub-192sess001/func/sub-192sess001-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-193	${datapath}/sub-193sess002/func/sub-193sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-194	${datapath}/sub-194sess002/func/sub-194sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-196	${datapath}/sub-196sess002/func/sub-196sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-197	${datapath}/sub-197sess002/func/sub-197sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-198	${datapath}/sub-198sess002/func/sub-198sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-199	${datapath}/sub-199sess002/func/sub-199sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-200	${datapath}/sub-200sess002/func/sub-200sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-201	${datapath}/sub-201sess002/func/sub-201sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-203	${datapath}/sub-203sess002/func/sub-203sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-204	${datapath}/sub-204sess002/func/sub-204sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-206	${datapath}/sub-206sess002/func/sub-206sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-207	${datapath}/sub-207sess002/func/sub-207sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-208	${datapath}/sub-208sess002/func/sub-208sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-209	${datapath}/sub-209sess002/func/sub-209sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-210	${datapath}/sub-210sess002/func/sub-210sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-211	${datapath}/sub-211sess002/func/sub-211sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-212	${datapath}/sub-212sess002/func/sub-212sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-213	${datapath}/sub-213sess002/func/sub-213sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-214	${datapath}/sub-214sess002/func/sub-214sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-215	${datapath}/sub-215sess002/func/sub-215sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-216	${datapath}/sub-216sess002/func/sub-216sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-217	${datapath}/sub-217sess002/func/sub-217sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-218	${datapath}/sub-218sess002/func/sub-218sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-219	${datapath}/sub-219sess002/func/sub-219sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-220	${datapath}/sub-220sess002/func/sub-220sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-221	${datapath}/sub-221sess002/func/sub-221sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-222	${datapath}/sub-222sess002/func/sub-222sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-226	${datapath}/sub-226sess003/func/sub-226sess003-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-228	${datapath}/sub-228sess002/func/sub-228sess002-SID-PPI-HB-REML+tlrc.BRIK[35] \
sub-999	${datapath}/sub-999sess001/func/sub-999sess001-SID-PPI-HB-REML+tlrc.BRIK[35]
