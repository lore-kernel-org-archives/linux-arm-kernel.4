Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728E5606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 10:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DaeLdsKo;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a9of3/qL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U4ErllPQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CjV2MobfznHWSd6tt/gdIURuRgsbs0R2Ml80INwwLeU=; b=DaeLdsKoa9Glqe
	vienGJM7guAGs6h8AAPXzgvA2nRnPpDYWv8m3u2cA9jWPJ/zETilJPxjkqBuvyhy2q8Asc3txJHQ/
	76+oDcr5ZpTJ5UqBx02mhSeoZxyVqBnLA9flX9MBg13BjcOxyxYroboH/eu08AXG+UX4RvAzi+U+Y
	1lF7aAHtUYSOTPToNVOP3haWJKwHbUkGGmcfs1Q5hf+EDVW9YJUswbM0N4jh9AW0kar8gxu5KhyRN
	yjF1KzwVOt/l+65lUB5qShM0GJb/mFW5cONb6zfIi5vDv2H4T/sMXTD7YwOk4F4KOtrg4iB9yp3es
	WdlCFdxg+AWIshMmEuCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMHc-00000000M6E-1IBn;
	Mon, 09 Nov 2026 10:07:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMHZ-00000000M5F-3w2s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 10:07:23 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99ux083792135
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 10:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CjV2MobfznHWSd6tt/gdIURuRgsbs0R2Ml80INwwLeU=; b=a9of3/qL/4+MO8WB
	lGHMVmTU62rb7WextgOeaYfECVNulD+JxEQXiv2o+3WOcNDeConh4zHrNfl3wtP1
	dmEnFp9YlHwyAZ40/tqS8Zkb+FYvJ/SVdmXTQH4q15PvZ/t8MYHf45rhiN1JB//c
	AJ9xFAQaPE+q29gR6sjkoBSwTyvu9b7EtbGHTDxqvTdkviR5SJ4yMPYRV2ZuwxCG
	UveAyYACnh2FZJePJhAHvhUOVNOXqWIcYv0/DjUa+tfz0eAnQTqcESlF3giJ5pOa
	+Y4BucgJ2WmW0NgK+P9xS36u43OYJZqgjm6bdT6twduSjkB5yHQyQUOBuacZlZ20
	BbSGMA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagwvyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 10:07:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so708579a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 02:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218840; x=1794823640; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjV2MobfznHWSd6tt/gdIURuRgsbs0R2Ml80INwwLeU=;
        b=U4ErllPQHRTngnRO7jDISjJTTGb3LtGZATZWzRImWUbsCy4EthKte/3m4+kSM6yb1c
         8+pXebIZ56CEcczy/wZc6vEoPIr3zJrK18Gku0n4Lz7K9KqIjkdXgZ00Ey5D5N7XokNg
         QredJoLsVZWm/Uhm9iDPdNyDnfMdmwTIv6XcVZ1spvjKM+WQEjGKlWJyogZS61fTG96d
         uwob9RuHe0lA23YeaTggnLWcgAgxNtP7I+RMT3sbGOKTBRAJAR4PemSoKiMgEomX/C1R
         yUtZ8qrtVbqDg008R0A8zpZKyo1ETrisj9Vw1jmPLSVqxatazqYk4Mbp/yU0UjXzsgR+
         HHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218840; x=1794823640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjV2MobfznHWSd6tt/gdIURuRgsbs0R2Ml80INwwLeU=;
        b=Z6SZpEJLzwwF3EkvfN712gyu45nI8NnlrzKj6whLwAvj8BG2jSUyZ9ggy8d2obHTp+
         k8EKcg5TyLwc47fGj+8JYDHsiVP2RZ5uKl0oGTcsu2jLR5fdIXk5ux/eu+CMKNwfIy6n
         fpi9WlBXWbToVsVazJt6KTsy2EvUJuOGyt45GzkSgOxlNOrUwGgxju7m/GVRV41U9uuB
         hL8Dj42fUkpQvYfPeYSgNp3lhkMBJRo2YDUvYFZ8E0Fka3usLpMZfFP3gVFRxeDgzzR+
         epl8ayGAlTiVl1gP+OJymzF3gQHvrl48NkJY0vgqI9oZQ/bKgzOUT1Lp2mA7mthY2O1Q
         PLOA==
X-Forwarded-Encrypted: i=1; AL+hErHZecwi5LDXMCevvz46lLlmcF6x5b1Sf9gySeNrrg+he9ylx9bMVrIVplrJ7fnH/KKqNU0/6X5PVs5qxPZrEpra@lists.infradead.org
X-Gm-Message-State: APuU4Z9C2dcyuFF/oNPaPEJ7r8F8wCj+JNLfw8proHkeyiOb/5DLmTQR
	KUlnbXYE+hsGOvcRRb02YUZ5UoagXSTmWLuP3Rz5LR1aIiy0A08P70xHnFmWBOW0fc3wG6dXoe4
	gObTGfyqRn5kflmP9vDcBKHdjsDmQm+VTpHYiEBuVg/9/hXyu4nzIzzCe5WQWHsaFIeu16j1u2Z
	zN7Q==
X-Gm-Gg: AYBFou3HYbD8EJ+fAdZ3i0iowNVyCKok3FOq6OlWM+I0PE1vz7sr2XKdUVuu95iZ/UY
	wP42n3mk0KBGwFYjLdNtov5GBW0XGVHZaRj4OEv0y9fFxhCK6Qu6gw6ISIeqL7DyhlHbYw3wDDx
	RfAot8Ct2TJuA5nvEGd53NygfZb0+Xa6uypPO9PqI+cVj2hTKa+1wYMeaxBYSiNAUtyRjSmcSHS
	3OqY2E1yy5cln/nOTVAApwGnYqcIjmtBR6saqXtTTCz+mNb1ytiku+rWCIQrHfzh9y5adKB/stM
	YXeIQo5i5UTF+8xSaWSQHrX4LOJhveA3oqXv3ff47odr94ODGuRbOg8WDhaFFHmIJD1UdOaGxQr
	cLqpRq3MXVbUlanH3bt6pRoeXun6EhfIpogO/AtuHrJ+73Nb9LMONAEA06wTMimeWSnCDjqHpSH
	Cta/DnRJHvw7+4y+oimf/YkTu57d08
X-Received: by 2002:a17:90b:4c8a:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3b12d54fb2cmr2526933a91.32.1794218839646;
        Mon, 09 Nov 2026 02:07:19 -0800 (PST)
X-Received: by 2002:a17:90b:4c8a:b0:3ab:be66:ddd3 with SMTP id 98e67ed59e1d1-3b12d54fb2cmr2526877a91.32.1794218839087;
        Mon, 09 Nov 2026 02:07:19 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:07:18 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:33 +0800
Subject: [PATCH v5 1/7] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-1-150335a79381@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
In-Reply-To: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, Ping Li <leeonion.muyu@gmail.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218813; l=1221;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=dTfzizx2O8pIWKkNOZ5/tj+tagXJPodOMUlPeZeSs18=;
 b=WY70CK6+b3HD6F8igEKO8LA8i7n1vIrZlsEcst/OXcFuilQ4b/kjdatXb+vwpsWJnrgAaH+bu
 vPCzTswnJ9zAht0xJL7Sy2MaO2ckK12jMWNndpRwzyY4PojyLFaYyPH
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfXypIHTh1BkcCB
 ryd2lqvkNxNpjO6+KyE7y5KVaXmTpOOQL3nwt631F1iGTZYS0dGEHAY/dgy9bWv470b3aAiVYHr
 LKRD+naG52ziWKrDXYAjNIorksMZWqWxc6dclWmeImjCZoaTwUQF4O7lVssbGrhBWrBMbiLx1xn
 VSYk7kRx1WRLXM7JAVZUey4+NnQHG8PMeFoPF5uZpUBxlAMo2B4XUY39nOM7iQZ0EqVnP+7rnfT
 ER2EVNJ4G1Kh2oVU8HDKuR7VQXmHTLIvnfBhP2JRojqN5NGZV0LmdsBAGLlmMcC2tu6BVT6S9Dl
 ecDQ3wWuer8RNqmLhkenuY93jeBnM4NRW5YFICaztboXB6XJcYe/8PovqVTOy7y7sDGqqmoq2Jg
 dvNgx6ZyF8/ZyVjk8NkhRlNzd0rOUa+2iJmgNU2phJgv9K5AlBR6WoUOTbvuGzthqPXNfXYPW5R
 aqaYfNGwDZsqvAN6wvg==
X-Proofpoint-ORIG-GUID: cptvrS-ipjWbSalcRJ-N3q7FYtX2AS6P
X-Proofpoint-GUID: cptvrS-ipjWbSalcRJ-N3q7FYtX2AS6P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX2SEjmfn9Cwv+
 jr6c5UgrLvcjtI7YUcFe5sOGvk275O24+bOHLFPXHtDDaOMV8KLXaob/JmBodXWSFSWsIx/01FS
 uqX2mI5DuUm35Ato04h5lzmhBol+Xns=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6af19b58 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=cxiLKowE09Ysm4E8lmYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_020722_104120_05C57AFB 
X-CRM114-Status: GOOD (  15.85  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
is defined as 16, so the check should use >= to reject index 16 and
above. The previous > check incorrectly accepted index 16 as valid.

Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures for firmware described ris")
Cc: stable@vger.kernel.org
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c067b6d57d71..05f785328dc2 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -700,7 +700,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 
 	lockdep_assert_held(&mpam_list_lock);
 
-	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
+	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
 		return -EINVAL;
 
 	if (test_and_set_bit(ris_idx, &msc->ris_idxs))

-- 
2.34.1


