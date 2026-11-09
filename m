Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E0C6082BCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 10:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tkAkfF+r;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bNbsAyBB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Idgtac/v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=; b=tkAkfF+rmVynEt
	ult21rTcRHAIGmNVzVRF4BcWV8xC4PSEz+xYObF0qs6qL0TOwO1rClIipzvoRTHgjDGXghNlKkRGP
	zVfAsRbxVuUIr6gtC9Wj/PPDS9mgl3iZPMZ5NKAy6DQZC2fEXHzkPQhm9TUYqwmXEBJfAkQSOkjeU
	dgMQ5RvAaQw3yyKo06p34eWMPobDxrsW3fSHRXwGpc+6ClnFN28EvRswqiy26cdPmuB2oilNc0Ixw
	sja+v/sdr+Xntww9qTU/UgOhgBluJaydfN6Bgdkm+d3E6NJvNTPwwhgk72lW21IPhPCkyuns+ns1w
	123tRWtQ3YhTSZqrUmdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMI3-00000000MKj-0KKr;
	Mon, 09 Nov 2026 10:07:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMI0-00000000MIp-0XI5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 10:07:49 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99ukxq3600448
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 10:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=; b=bNbsAyBBBX47e9R8
	e/n73IMqaFJxB50b05woDjdvPpwV/cafqvJ6Y+b2MXb//LgN0+r2Oz/Mjp7Zrz5S
	AxSiaEhKEs7Z1O0RaThalq0vYzPwOWIguspYyVKuo9+BVS8PIq+ELy6TFU03pyrc
	Db/G5joaV1/eZVI7Km6Ztx/vyRIp+xH1WeXV7AyEmBZ375TI9Vo08cv5glb9/PgP
	CF1Wild9WOZT4j/tjtlsdxAu23epLhz0uAe4DW4AGhv1V8bf5dWsnmQyoX9xPOqK
	ao/YNQZI8NB7944kQORemBL/Ovq/7RYn0VofNKam3iD3LPmW4c4cE962v0NpK9Zv
	hd1ujg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua588fqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 10:07:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a528ca65so780656a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 02:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218867; x=1794823667; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
        b=Idgtac/vFcrfXSYVjubk7wdp7ugSkJf21o98wARTh0hlC+Heu2h3TOAIldWEo5eCV/
         Y0VcsNgHYh5oXAA4VLPoOTsnbjIkI9IjbeLbJ1UDsWBP0qRYTso4e/WDcL2zNFNbqFfU
         mnLVnAig2+tUqWi6t2X7FUMcWCJOh+LC+tNS7C9mhq6aLCS156YAFzEBW9JXKrgMQa2k
         iKwh7rkBdiGccbvi9fgmhXudaMV0eJoMIRin9fHVWbv9RvQxXN/4XxRn+byvs/nO8RaT
         LU8a8w/iRIZnTmT+Feu1+3ZeHj4BfFRtGAC2MojZi/8ACJyHZtL4IgmrazYa9ik/+hqs
         WSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218867; x=1794823667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/p54A/2e4hZFHcid+4VCDQ25Z8tHYviReY8MS3Eaow=;
        b=2FHCsinhQV9XNdNh+rLkOLqqYqw+EboRByxDQzxDgHS6sHyRgC17ujNrr15U6+4DIQ
         iXC/xs255dh7/ed4+Qsdc/z65Af84f8RwlfHUKPC++Al2u0LUcdMa8JB4ENz0p4AXleH
         YV0m7zi3bwQis6cCX3DcfsEu/Ya6osTLM4SJ37M/mnEQCO//ImBfH3+OO1OInFu2Msvk
         GnR/0jjGblqDdB03/fM30qqcM2ErqwoRliBfyTilvW+0PEXalpx+eeGZEf12u0wUwURn
         J7HcGyS3roo7kXdFCmalCXjXJ0ltB/w7cBuE2MRZTC8O42kad3Q69uHkG5K1hUZ2irjl
         TrAQ==
X-Forwarded-Encrypted: i=1; AL+hErHx5pUKvN/7Ktnie45XW0T2cub+5C2q2LsJFBE6nU2OE4NobcScvrxUQ5AFlXeEvpRcSvuE4UPi3bFqYSQnqAAI@lists.infradead.org
X-Gm-Message-State: APuU4Z9gegJ7fYzybhnRK4N/hUrF0a0GuamYXbG0hfaWa/Nc1DryljUN
	T7s20bLpiChqmVYyqytAyK07qDkeZYCPEoKl5XTk6Orq+6lrhHWLCXc2K9a7MnCJxspo+sn3Xge
	bo6ueGr1Nzzq4tUGvBBfNiovOkZqFM0h63DcB3CTEiMnN2tJ/Lx114aYok1W1W8OviQ0gjXJYm1
	t75g==
X-Gm-Gg: AYBFou0w4Vdok75bfTU6nwKPS6SOy6DIwWdUx0N0Ad3N87jk562YFpntfnqT775ALeN
	QItQHMzG1Pv2n1XAfQu3pArNO8ANVWmXbd3PRWe7g17upE+jnjDEbhezyAlBfvkIz3rgHG43Eom
	gr/FSsHp2HsnGGCdrdMXOKO6R80rmA79rrPzia9Tj6xk90QObIqk8tSadVqe0SyWNW4yp40yBm+
	0OKoxXlf2N1FImJ9zLsr6T2nNVC/9DYmW4fkAMqYLiJE1sc2T7y1eObqImW7Bidgh1p6otkrh9d
	SW0RiGHzbRN008frEcd2BBh8pdjoqGgIJGK0JPJFbmekpdsuF9TmelSOizXKP0oMcaeCyQAl3/3
	wJm7jZvupLHsvSkB/6ntbkOWzmV/4Ba8tGpoWG68Mkkc4+jTc9F98BjhxfDbdjrLsC7ltXnSNat
	FeBWUs0stFBiyjjhNRYUF+ley6+cpK
X-Received: by 2002:a17:90b:5804:b0:3ab:33b6:2c27 with SMTP id 98e67ed59e1d1-3b12d4207d4mr3363430a91.23.1794218866302;
        Mon, 09 Nov 2026 02:07:46 -0800 (PST)
X-Received: by 2002:a17:90b:5804:b0:3ab:33b6:2c27 with SMTP id 98e67ed59e1d1-3b12d4207d4mr3363381a91.23.1794218865811;
        Mon, 09 Nov 2026 02:07:45 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:07:45 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:36 +0800
Subject: [PATCH v5 4/7] cacheinfo: Expose the code to generate a cache-id
 from a device_node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-4-150335a79381@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Ping Li <leeonion.muyu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218817; l=2378;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=cuphFizeBCUAPOmTA5mjgloZDLbPkPyZqyfKN0YBZdI=;
 b=ozOGB6eLM9+WzelhJAT3yEtCsqCzkfhBnvd8PVWm2gJ8zV1FxEktehv06soBEhpURkRFYpAcE
 GrCUpKAbEj+AXLMisyOFGQJAee0jz2pKuUsGzIKusD+cqkcXHut3kO1
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX/iC641x1E6Qy
 EtpYn1bs5vKPDMpeUZdETq7Bx1Rdt3nMWYWjahJeaB0Qg8jfoxxG8hRBxI9tgHI+wt0OO1inWNY
 uYdCLXJxVk87p5oKCcOZWKhj57nT5PhP351F5Wp0tE/pQfVaqunnxe4KJrgjt28qXz+e55WFvrb
 vQN2C/X+kLjTtI5cB7VUs8xAxOOaX654O5zgpH0HmonRP0dZvuFIAanr+WA8Noo+o4Er7/a84Cm
 +MeJV3/mVkY+dIn61kNFKpr1iOkLV1wrI+mZr9cNdhePoXuSvywWhAzT9Gk93HqM/rH0fYdaDs5
 dj6UYkeA1oyIpTY9tNwTZCpf5COdHiCmCWpGuJL0Y7JUfPdAX+h8tNynkfKTfigTl5T7i7ljDOT
 B8fEGPiKrt/2DkyJ9O3/3NrObf5qt1R/cRX7EfZI83INKIsI8paa6HNZDfMK+lTWD0HgFsgzRlx
 eNsZIYqVJKc3XtuQYyA==
X-Proofpoint-ORIG-GUID: H65tDbEVKv2UpXlF8gHpN5wzTC5u1dLk
X-Proofpoint-GUID: H65tDbEVKv2UpXlF8gHpN5wzTC5u1dLk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX5KM8+RcH4GNC
 6UQSKBZnfWFcjcRqQgmSN4dVbGYU/3+BzYhBaa81jwSwo2uoiWXV//KtHPXx/xC2jTx5nBC8sbq
 KaXi8LhNkXD4h898NJEjxkSQz9jiIYs=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af19b73 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=2UMQdz91M6SPgPM9X00A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_020748_187960_A9DC2D61 
X-CRM114-Status: GOOD (  19.64  )
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

From: James Morse <james.morse@arm.com>

The MPAM driver identifies caches by id for use with resctrl. It
needs to know the cache-id when probe-ing, but the value isn't set
in cacheinfo until device_initcall(). Even after device_initcall(),
the cache-id is only available if at least one CPU associated with
the cache is online.

Instead of making the driver wait, expose the code that generates the
cache-id. The parts of the MPAM driver that run early can use this to
set up the resctrl structures before cacheinfo is ready in
device_initcall().

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/base/cacheinfo.c  | 17 ++++++++++++-----
 include/linux/cacheinfo.h |  1 +
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index eb8a907f6d50..a4b10f3a9007 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -243,8 +243,7 @@ static bool match_cache_node(struct device_node *cpu,
 #define arch_compact_of_hwid(_x)	(_x)
 #endif
 
-static void cache_of_set_id(struct cacheinfo *this_leaf,
-			    struct device_node *cache_node)
+u32 cache_of_calculate_id(struct device_node *cache_node)
 {
 	struct device_node *cpu;
 	u32 min_id = ~0;
@@ -255,15 +254,23 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
 		id = arch_compact_of_hwid(id);
 		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
 			of_node_put(cpu);
-			return;
+			return ~0;
 		}
 
 		if (match_cache_node(cpu, cache_node))
 			min_id = min(min_id, id);
 	}
 
-	if (min_id != ~0) {
-		this_leaf->id = min_id;
+	return min_id;
+}
+
+static void cache_of_set_id(struct cacheinfo *this_leaf,
+			    struct device_node *cache_node)
+{
+	u32 id = cache_of_calculate_id(cache_node);
+
+	if (id != ~0) {
+		this_leaf->id = id;
 		this_leaf->attributes |= CACHE_ID;
 	}
 }
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index 56fa646df0d1..469d490968ac 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -114,6 +114,7 @@ int acpi_get_cache_info(unsigned int cpu,
 #endif
 
 const struct attribute_group *cache_get_priv_group(struct cacheinfo *this_leaf);
+u32 cache_of_calculate_id(struct device_node *np);
 
 /*
  * Get the cacheinfo structure for the cache associated with @cpu at

-- 
2.34.1


