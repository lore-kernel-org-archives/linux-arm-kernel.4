Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D097E60A2625
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 18:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N49EyHaY;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F4C3p0uT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UAKLOUDg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5blIPjIlG4Tqncmpqw1YPjyfSrVOP4aLHlJQeJVXqWw=; b=N49EyHaYStnYjkXed90XemaVin
	FpmfTHDUriPEM7AVpJo9lk6idq5AqzHNriGdlKVcyLX2xZFooWulxybbEJFesgOgMAwQ4zndyLPjw
	ricCoWVoiWWB3fItEQTJ+ES+pfZ4MT8S9TFR0NSwWjK71bbEE1ldCD0SKHKQk6Guf7X3jm4mpMx1/
	/X4x/zedwPzM0EsWgxZJL+ZdX5o5pFnQn8fcpfnS/CF8QBql9XfffuO1AGBri8GHdULQfF2ZS0D5K
	naoscIoqRkJGDT+EqkbnNaeOJvJQ9qsToKAfkBHaXOJiVtk05KApAGeP8Iy8OMzvysTZsA4l1yCiG
	U8W98V+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwPd-0000000E1Ry-3Zsd;
	Fri, 13 Nov 2026 18:54:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwPZ-0000000E1NM-0Mg4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 18:54:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFQruX2022374
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 18:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5blIPjIlG4Tqncmpqw1YPjyfSrVOP4aLHlJ
	QeJVXqWw=; b=F4C3p0uTcayVoNsjTKTmaLlVTDIWq5+em3PnoebAU5jDnbrofFq
	S36f7AG06UvYBUS8nh6TWKxLxv2n3JzVOfe7E8l6EhAbBbSo3Ds6jW37Lmdvr73W
	LXpfxW3WsTp1uKcxD/eh1J1jZPXhwKVBUI5+G2kw+1P3s+6+Xcay1DWE/SAudZt2
	rXMDKBdh9EebD2IH5Jd8Iy3H1zH9eA7+wJpEq7Uik6dow/eXQI4zKibhYbjIR//2
	1RTWK3wr/co5+1woLUhgplQt4kj1d+QJ8CI5IQbm+U3ywe9cFYTyFLkJV9zdWEJS
	Jse6WhxgFbl1UOH5gJevTA0ipc46NPISVRg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx0g21vru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 18:54:08 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2ecff433dso1201259137.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596047; x=1795200847; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5blIPjIlG4Tqncmpqw1YPjyfSrVOP4aLHlJQeJVXqWw=;
        b=UAKLOUDgfqbBLjv2jUSvhYsyOxK/lkVdlvqsGsWHvVfg/0sTEtNGTNrekkyrsZyQjK
         Fq7vyS+hbB7IgAAko3lcT8nH0OwofysEMrDJg1L/8vu/1Xg8BSF/Vj89EWABC8FVD0hc
         0k0EY9DTj2Xp0kT5KSHrRlT2ag1PHjT2Xxf2/XavmIHYxURBWtXUUw4AfPWxQ70+BlfA
         TKwRFT+4PzfFNBcJlxkzxszoddMzbLZvH3eMLrLDZ41NsXp5jFR9sSflkkI4H96IgnRu
         IezgH2x4vCZeQxixDfgebPFBWky5XD88O+Ga5ITJJjR+OppPpExHBIrJbFXg5RaARgTx
         RQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596047; x=1795200847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5blIPjIlG4Tqncmpqw1YPjyfSrVOP4aLHlJQeJVXqWw=;
        b=HsYopBtap5A6VtZfiY0m3VKy5eYw0Q+RixiH284IbWd7Ito6XOaPXhyPCFgSCWaKyu
         wpxxD6rMvyDrQVkFWDoOip2lY83shSFAJW799csrm01+/b08XsU6AovCRupPd6nPJLn3
         e/1BIlrv1fxCxZZBgFfL/C1xuv71kIgbrY1U6Z9QzFErZPzX5ATAEbMvECiI4Ap3Oubg
         qlvUP2WT+WDad4FARbD7gF27jsYRqmYPHMTgkYjPdvcWkiN//yVbDwnAwZMJc6fNn2hi
         PD7/X55vMKHKhrXdfY8gn8239RbJ0Cx95YsMWiIsOjewMKy9yiSkBVFHX4Zf0FA7EhzH
         Qqhg==
X-Forwarded-Encrypted: i=1; AL+hErFh9J3fsMtPBqSuSJxIwpfZ085Rofip6knF28ehxfVQiE7lv0AyUu6AMtVfEMAUl6I2HHaMqEnHfVSOPzgxXhSb@lists.infradead.org
X-Gm-Message-State: APuU4Z+RXglGIZbSQ6nc59t7hQaQS5H6DIAVlTQMr1BOQK8/IkFwvUSN
	mH++CrqUWqsKSxqPr9kYPB7xxwPZQkEpaNzRpjVUNSJpZRv584p0zy5c1bDl1CtOQJCnS5LAfe0
	dFYOOqC9m6CqK3l2DZshW1cs9FwS0Cg0wVWg8/yjuPo6VYiCuCQVTwQBRHg3fLjVlXKAVdWJxD+
	joiw==
X-Gm-Gg: AYBFou1qFXD3YrNLzfvmU5uIWFBZ9a6AhtWzmjdEHPGucSBtpedwHcMvRpaujuqspsL
	/HqzRUpcAdb0TVym2w44sQiR7mMiQPhT5XhAkuxhjYpe4DpEf4kSo9HMgNj23EkzK0aH2wY1sUX
	ajEWzCAhRlHrQeqVqkg4ZwFFPzUf57bKmH0GzRBPEq4aCixIDJSwdtJ3HE806aJWb5AtNTkW+LY
	YjGlVzU85quH+kBl1w21RIRYJMbtVXP9e9GJO7LBDRHxI5c0Wdnz+ChRKiqfBzoNEslaQRoBMxW
	yBHW8w1QpAlJGc5792bDwyXB8WGrNvDPvmaikQwio9kkdqk4GqDFei1+AAqAwxyhiCVe5CfBR8b
	T23molhAqFidY7GeW5229WU/197kXp7V9NBLVFw7FWQEZ0ZkGg/nAj3pXGaWHXg==
X-Received: by 2002:a05:6102:441c:b0:7cc:115:ddf4 with SMTP id ada2fe7eead31-7d64d847dabmr1495135137.25.1794596047584;
        Fri, 13 Nov 2026 10:54:07 -0800 (PST)
X-Received: by 2002:a05:6102:441c:b0:7cc:115:ddf4 with SMTP id ada2fe7eead31-7d64d847dabmr1495126137.25.1794596047168;
        Fri, 13 Nov 2026 10:54:07 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5b4a3fcdsm45640325e9.0.2026.11.13.10.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:54:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@nabladev.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        devicetree@vger.kernel.org, kernel@dh-electronics.com,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: st: Correct white-space style in stm32mp2xxx-dhcos
Date: Fri, 13 Nov 2026 19:54:03 +0100
Message-ID: <20261113185402.183367-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=789; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=8Co3w560jrj0hkoBQfgpSV92w4nLlNZ2yKdgRK4VsXA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq91zLBYTXZN4JwUJB5ATvPeHihZEaceg22dgyQ
 oXMh/poDMyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavdcywAKCRDBN2bmhouD
 1zwpD/9HHdOVPkCYc/ZkoTHeCwfHgj1qnHMhAOqNoHoABa0ykth/ZzERBSFOXlnfLRB6U/kJSHD
 LTtjX5ypIQnhzs66OAbadpoz2thfGBrCY0c5u/I9C9mPW+06COXIoty5p9K/umkrxAtrcdBXTRZ
 zpMbGdo8tZ2zp6CrjZhk0eAu0Xmf5Pia8sTsc76agOiAHQwSN/gIS5aZXI+QNICnqV6CEGeAl2K
 xQPJZFTIj+uP5y/qy1/b13d5mU23Ay7NeEpmIXAhSrvWvc1i8+MDXqYH6WqxIlgIerCAESWRFAk
 WbvVphDqvgmzkq13kyTUkKE3bIAHCyk/47Y4IvIfX8sFFLXgEs1i73nn9VeXoKplXnJ15xAwhJL
 nk9pdUqF5kLsC/jTRocUq1RMp68RGntnwtfxzMYfQSQEPh7CRSZ/2AKy0IvQgNN0BdmrYJ99ex0
 C2afV9PEtUpTAW9N0sjH6Nckt5PioeYhFFLopQBKZYX09TfVuulPg0/lIfgDHesKDasekbdboWA
 3bK00HEP/kujIl4yNT8vz/yMR/UDSPAPKJ+JYLwkGQ2uvqVf61YnjNI+sEpd7SQctyQet+Y8Om+
 vF/SdkFcG19/gdw8PmgwJPQVBHcGQbiVnlbMwQEewYi9o8y42l/hhNL/kYgK4ylKm5N1QOvpmCd kZNxbeyEtae6kKw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX0gczFWeZqH2K
 BsWwRjfZKpLccUCwMBcctxx7uwLkwgKGXNt27cQXDBy0g8zE+foa1vJUOEsST1zK+AXvwOZAPho
 sFmz46Qy75wb3VWGAYrWUwhcs3vfPUl6sMYIfyX71SiUuxUliZArKeCPsWD+K6Y65dI4oy0ZFfI
 g3AJAvW5akapgL/dJVDy/7860FsmBkWkpvZ7SV18bWNIRSnVS8to4sMHAOONgrlyoQNESeybCKe
 8xAL5mos7CBxvRoTq/GrHpJgRdNCe7yFK9k7lJzmf+s2P2Jb3d1dUp4mMqMqKze5ujkV7hrR7oF
 FFYXIJECFycmlrS1g1C/8yuTCEHtOkch9wkTnpOH+6PcsQMTcLK2jyRiFwqwtMs5Qev2ngSIgwp
 SNk12a3/KcVMLfm3eJCiGGkYqQKDMrBHgHQEpo0WUJvouL4Qrcn/Yl7WrWpDHZ3bugEyf3z6i6x
 6Qj0A+DGXp32j63MDTA==
X-Proofpoint-ORIG-GUID: 49SmZWp_EiZ5gTjxPy_mBPnU0S5I1RIw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX2mMRWNcUfitg
 CDKakj5VaOpg2y61aIByUSJ1dGP7Oro0aQZ+SIO15tKeiDE4peKD9f1mdVbELhgg4ajLpzLLS/4
 g+7NS/O+shbUBGxNRbhWCrrBE9W7iZE=
X-Proofpoint-GUID: 49SmZWp_EiZ5gTjxPy_mBPnU0S5I1RIw
X-Authority-Analysis: v=2.4 cv=SpIFe/O0 c=1 sm=1 tr=0 ts=6af75cd0 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=F1UETNCCN1grUUcvQL0A:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_105409_178281_8405D7E1 
X-CRM114-Status: GOOD (  13.30  )
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

Correct minor style issue around white-space - missing space.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
index bcf63e2ea989..5453389c3ef0 100644
--- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
@@ -97,7 +97,7 @@ cm0_cube_data: cm0-cube-data@200C4000 {
 			no-map;
 		};
 
-		ipc_shmem_2: ipc-shmem-2@200C6000{
+		ipc_shmem_2: ipc-shmem-2@200C6000 {
 			compatible = "shared-dma-pool";
 			reg = <0x0 0x200C6000 0x0 0x2000>;
 			no-map;
-- 
2.53.0


