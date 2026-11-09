Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB84606EEA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ci6Ht7WX;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qb863sBI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bnjkkoL3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AjrhCINlUbKIbvCUMy8NACyvmSbvDdLn5Ljj7rMFcZY=; b=ci6Ht7WXwLkX0F
	cECiAXLLH1Q0+2l07eIH2WuUR5TZ5SMW0UgacBneO/KzAobSYxBjQTOV8Idpg1TGGYuS7uG4hE3e9
	kPvwXvcr0lNWmD8Y1m7SSgXQvQAXPArH72nl6DTAImycCr6RbbeWtLODQD1wm5fL1pEzBx4jTiBIC
	CFDKE+IJw+nc8U3Qogcu84qWuDOvNVh/5zDWAcRZ+ItyQkx/ta1a9v12VcGW+WyfaNRPS1cIkxzOk
	yu99DNzFCK9s60j2aA27Eq4gJe9I3Vw5VjYqwgskvnBzSMVDgQPs0XFmxIuzb8M30QqrexdZDwsV2
	7KBfQE0F6PkkqfJneIQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMHm-00000000MAF-2BaZ;
	Mon, 09 Nov 2026 10:07:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMHj-00000000M8l-1iYI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 10:07:32 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99uwma3035286
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 10:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AjrhCINlUbKIbvCUMy8NACyvmSbvDdLn5Ljj7rMFcZY=; b=Qb863sBIHPMRDAn0
	hes8I7xH7m4yMwSRxsNLe/4HAEiM+QtaDNVayXp9m0sO1myCv43xXTfSyHo0UfZ6
	XOgdTP9+inmJQdkuOan2FHy+EW3bo+ccojW+OIiW/UjB2oLXXPFJ1KRChj9WRS9a
	4ZvldPqTgTLeLnHnojOY+PTMFnMVBu0VAOa1mVf4jDlB7CxQAKGlY+DsFlnjfXgx
	mgzko6BcUp844bHQwbRmDDfNVTVXeaEsBh0skLlXH+tJuhYtIPa9c2e2QH81h/dO
	c8zFafIkUW4TZ+0h1HZ7sz/K8r0P52vsI7LXpuqxjTMSTzwHJOEN0ZGCGAiXSimf
	qyP1SQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvc6nrdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 10:07:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a519048eso653556a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 02:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218849; x=1794823649; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AjrhCINlUbKIbvCUMy8NACyvmSbvDdLn5Ljj7rMFcZY=;
        b=bnjkkoL3SgQ5gppvZLxJog0GbMd/jn9d0+tIf0YslX5FhHXXodFKXa8oCu3KQ+JJ8r
         PelQZpZKHrRfwIX+nyTdthkGofuQ9suYR7eVQX6yoLOdH8ojHVbgoHZzDGtuZhq5JBPw
         A2fhnZNJPspDLBGlRkzWMiXdGi+Iayvk24U1bYfK7F7BA/p+gSBkTpZfSdVII1b+czST
         N68qQ+adlTejsekWCCfu2hvQf1fMnAnnf8teQjv3mS1mJK9E5dB4fWOSuZfsaCfYnI9/
         7frI00bvgl5NhBqiggDs6KvvTBpDUCiEwnQ0wTDd3SK1wg6p7LmobKCFhItnr/JE1vm8
         AAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218849; x=1794823649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AjrhCINlUbKIbvCUMy8NACyvmSbvDdLn5Ljj7rMFcZY=;
        b=E6iMa7tu3WRlSWMzLTkhNVki1AjOueIR5MNtDelAyHjCs7065JwBi6t1XPB5/vJKo+
         KCF2boH0d/xpE26mmw4mmMdzk18S0g2fcljP6x9/rZa+iOEZ4CnWwOK9uEs82iOTtlJU
         DF1p0tCG/WKRxZrYRNNvGjXA5/6eMJ84SjjVyzrhzl6OVRq849ZSwO7Ww3ZGEqlG+lML
         iSSp2NdXRhs94yJaqJict3E5x/Ko7Ej3aDGA4fF4OJlFIabHX9c8YTAEDL1LosiMqpLa
         D8dkRkY6E53CrXm43WHHegTh2OCIBOb9WVxkPXn+2UyP3cYEAYTO4kyJeXCU0j9Z2D40
         LeGw==
X-Forwarded-Encrypted: i=1; AL+hErFUbc8tpIseytL5okmvqWMMA6Iz1vAaFvKqOgNCkwdgaunf7Qh/szJjqsKKgbhiFSnbMtD5ZY8uLA0wav2vPt6G@lists.infradead.org
X-Gm-Message-State: APuU4Z/vWwSfjbqKMVeHx07D19Tw7DhvbNZbNexiMCqgpcc+XfMCHJwv
	iSn/1/NNCO/n6tgKWFNJZpJ9uw34qUjtgU6McnLBWz65wqt7orUPCpoEU2/ogcWwwJ+FCiqhtbm
	tCRF+KDaFUyJ05oGDVIcUFgQFwSoyqTsZEFb/9zGGV7jlMZXUwqLQWKn/YfgbmdZ2rfk0UqRj6q
	4gHw==
X-Gm-Gg: AYBFou3wza1IRFaLxfLKt7nHPjYUYwF7Relt/8GvQNcpwDM/Cmges4NYQGLpWY8lzyp
	Anm15LAp2w/doRktIQMFmjYSim1MHZdgcJh9IrLpYdgrXVOssPIjPRV1fES1OkM1RSn0dUi9BLU
	+61rat9XfFOcN088KML+Z0KNGGLbkwfYEPS3Lw2qY55pVpte0P3D1WWL58tAPXl3F2154oYctPu
	sFJgN/s+n+rDkOucqxUkyuFvNjSBnj5yFeFvffAel8fkNcO2rSQWSTF2MAHFcyKDuRLCFYE75JF
	cq5KFTeTq4Soy5hjtdzrWQqpsIIXiTR8dflrX636LgkEPAF2rbcKLsYlncJPdt0tFXz72lTTg5R
	gyCsj0SEaZ2RQ+4OmZU0AhcKVvmmg+M1IOQbsxPr4BZgVeljeviQbyjDjiikCsSpfqIydCe1dzf
	0msIZcqyEGMyC3OQ/O81O3hyXIaIp5
X-Received: by 2002:a17:90b:53cb:b0:3ab:5758:3757 with SMTP id 98e67ed59e1d1-3b12d5ef7f7mr3152463a91.61.1794218849173;
        Mon, 09 Nov 2026 02:07:29 -0800 (PST)
X-Received: by 2002:a17:90b:53cb:b0:3ab:5758:3757 with SMTP id 98e67ed59e1d1-3b12d5ef7f7mr3152416a91.61.1794218848687;
        Mon, 09 Nov 2026 02:07:28 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:07:27 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:34 +0800
Subject: [PATCH v5 2/7] arm_mpam: Fix MSC MMIO window size off-by-one with
 resource_size()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-2-150335a79381@oss.qualcomm.com>
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
        stable@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218815; l=1979;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=M5HKKySRXJjebPuf/KLcSrGcy+Dr1wAQmzTykz+vO0Q=;
 b=Q4QHKXfPyNxTfeRfp19balrlzMk5OdUU4eKG1aMyyqKAydxt1uebl+7SdXXRpbAEmQKQ5kN5Z
 6b+fSzkJixxCQwVFnssHT0MQsX9Umf3yTmY82A8IiSaPn1rVqaz8JAS
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX6ru6y0AxEsie
 T6TVJKg/RnJ6rkBHJNWLgjnIViK4zF8AwNS0+vyk+fomQrIoOeLjzQ6OXKu/7XMfaWVwahTOq+b
 hrXRYE+onZlm0lAYMDZT/Gvb8xLQgzHCwNiqFlPlHJ4ysUJdGnB90PQe9BaGeYjM+VZlYjMTaeZ
 TGv8KLiXmqgfFWnSsu3Jo/J5UXvHiJq2S7IwV4ve60eSrUCnbbLBE5n9j9RTTs1AFi8FNV1bhiP
 xa9Y+PQOQJSyke/dxxAyA9ZkHOE7dAfZmylpnJCybM6Pty4zsif3riHx7/tomCl2PeJgfdS75kk
 REVFzC15/RGMltWm7dA3v7lcqYYq2B1MuCoKRXrgRpd65CUHPw6uZacjblba6Ya5lsKsUsftJ/V
 aajI5RCa5CrBiRnhJEkDPqvBKnlgW2GKr0uqf6ngwu8r1lmPaMHKCmODms0XpJCzsfe4gC2DIK+
 Ahih1OENxHQoVCsOS+g==
X-Authority-Analysis: v=2.4 cv=WOjqzXsR c=1 sm=1 tr=0 ts=6af19b62 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=i0EeH86SAAAA:8 a=s3E7sL18FQBPR4dFS-QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX2AIFgZMxC4Zk
 cocSUULxW0snPnniOKt2cojdPwI8sxKzOjVV8KL3mcWjPHsOyex1o/H3MahBRRMyTU6diiX2YQm
 3sx7Uol49ahKQBIwob0kJYrJYsPyUKE=
X-Proofpoint-ORIG-GUID: 4VRBVVgOQmXFtonc1ifrgkJZ1lau9qFq
X-Proofpoint-GUID: 4VRBVVgOQmXFtonc1ifrgkJZ1lau9qFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_020731_570672_49E27B95 
X-CRM114-Status: GOOD (  17.84  )
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

struct resource uses an inclusive end address, so the window size is
end - start + 1. do_mpam_msc_drv_probe() computed it as end - start,
which is one byte too small.

mapped_hwpage_sz is used by the register access bounds checks, which
have the form "offset + width > mapped_hwpage_sz". With the size one
byte too small, an access to the last register in the window is
incorrectly flagged as out of bounds: for a 0x1000 window, a 4-byte
access at offset 0xFFC (bytes 0xFFC..0xFFF, legal) computes
0xFFC + 4 = 0x1000 > 0xFFF and falsely warns.

Use resource_size() so the size is correct. The ">" bounds checks are
correct as-is once the size is accurate and are left unchanged.

Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
Cc: stable@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@intel.com/
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 05f785328dc2..bea231dac7e6 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2506,7 +2506,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 			dev_err_once(dev, "Failed to map MSC base address\n");
 			return ERR_CAST(io);
 		}
-		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
+		msc->mapped_hwpage_sz = resource_size(msc_res);
 		msc->mapped_hwpage = io;
 	} else if (msc->iface == MPAM_IFACE_PCC) {
 		u32 mpam_fb_msc_id;

-- 
2.34.1


