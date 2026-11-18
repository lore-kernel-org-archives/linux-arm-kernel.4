Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0234606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 08:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SCrGr6MM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=r31uOR+a;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CPnE0Ajj;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bk1MA/cS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=SCrGr6MM0meZeT
	ch4/Inc4mmKAAoQWIctkVfwdrvVa/afdAMsb37Bwqbik47rPCkitjQjoGYrBrdNMKzQzZ9CsqbcmO
	aRRMhZZ0+w2zrz047GkJxo19/BXStom2lfdB1Kh0bhXd73GnrJwGlSokQVYqQbwGH0gasjk7dk/jV
	Dwuau0Rg6NLDx83HW88mWEDWqf0OoUkFBpmHWVAv6WuMZups+bRk/qbDBqe68b3lluJd8Spv8MO1K
	1LcD5AR3B4fbtwz/ivYI80gLQ3vvv2CflttW3IS7eqddtaLv9wDOstRuQPWAxfW4ezDLM5g5HtKNf
	bvnMze4J+OqJM1OCA6Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTae3-000000085xe-3gg9;
	Wed, 18 Nov 2026 08:03:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTadu-000000085oB-2ohe
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 08:03:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=r31uOR+aJj5f8V0Z1U5rl9k8ch
	hOVdPGiTu6l68HdLCfhN4UTHDNXjCtc9kg6/z06SfFHzBw8G6aEBcTXiUwr8aTZiYEqaOkrhzHKGj
	0CgB42fUASKKeZAm84g4DvlqZjKMX36JsJLtNPeA6EdxdZ2xYRhIw/uND21cPJiRQ+IkzOi/59oK6
	ZAih4nNZchOR1lJFeiP0T+oeVd+KRB/AjiEn12cyQSKIBpbp0MPqD5E3Ln+6Ny2/Nixr0eQHXPYlR
	Cw12JiFxG34n4PX0hMVWmOU4n5B5wj1VzWLwIoFiSdLz/UK0Q18AI/7hKO09r3jXCO3X/3o7md8JV
	wKTpFLfA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTadq-0000000BCia-3BmT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 08:03:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UxSO1430540
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=CPnE0AjjmS1OKti+
	jsKcwPsoZ7wslvTnpMnC+xroU+ZLf5jzJ28cCteayLBq+8kKHpBW8OL/FFwJtqzA
	sWnow2ODDb7TyWFSpNQAonyQSzlVleAO6O6F83fp56lQn8v2++HSfZ7/qhc48L6O
	uDPEs1r2yo5DGDYdRr5PJc9yp0umRg4BDNSLrBNw81SzqQfjNwRIYbiJ9AgUm4SX
	bB+ZYwlWwWmhKA/oVnxAbA+E8rXa4vfiHm8jdjkTbDsNkcl2VscFDJAyC2AZa6n6
	JKPV1B/HpSGNHZLQm1xKBjwEaMMFjPWHwTBdRY/vY9P4maveoajbK/ziMlO0/1Fx
	Y2nk5w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv91x1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 08:03:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3a9ee822fso934628a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 00:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989013; x=1795593813; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=Bk1MA/cSypiCcUkRNqERHTu5OdWh+zxJQUBKOcq0gBz5a6I4tRXC0Z9/Oe9j/9Vp4P
         BwxUpxy6Rx+VpPAgDQ5i9JpuJEOHtjPewLF4JIGYAoOyAFn3u98h3wOQhLdQJhOkXEPs
         w+GuQlmlGWwh+wFZeg1k6NhTEhK0exGOFbkm6BhzZKTivyq7yeq4Ksqafsc/aQKC39+r
         P81XH6Vk2rR9BQipd6n5Ccs0Jm91m2JIRAJ4rSW18ZP0+R9QNfuKqt4pDOJO/NmC0rky
         jWHJlcdB3RR2L4h3G+TXdENJ0+1UyqF8QkTn+wnQ99P1/QdYksSEusQhrvb5vxMBcjMD
         XPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989013; x=1795593813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=H+gkpiyUQRbUqBUX7GPG6StvyLra4zqSL2okkd8RrhvIKrpCVjUeb7vpsQvVSycSin
         uv3w7uGkK0bCB54sh+4VKTwJu8qA0CfnGStBzp2ZM58PFt5UiyTlD59Ndt6/lXC+LN6X
         FUbbyXLMQUIVPLSdEAsr1RW5zxTnM0ykHSb2d1DD3ogaHq6Fn46hz5NLQa7h0SpfRbMp
         2UzIcMtR9EUyqER0AT8uF5S6ntr7esFAZDqUf5DNKC83AthiUk5HXo0dUNgNyEGoLNIt
         GNjlucDEzKjdrrxBSb0nseGZWaC9M3I+GgOpsJ5HmA3M896YLfmgwszHcKK3ruAsiaUb
         bUNA==
X-Forwarded-Encrypted: i=1; AL+hErEyOtleHmq2OFvas/Nl5X4WgwyulZmr6q5+9ApSXBP4n7iacwTcJLAbIBxTvu+JiosDsa5vGt1/e6WCHA6+ybOh@lists.infradead.org
X-Gm-Message-State: APuU4Z+10+7nQBdd5dmW8HDUzaYN597BTG12s3WDLyx4xe3/67v/vpNL
	gQqLLEQkojm9oOk3s4OwZiIYtnpDN+sBRdAQZ508MMWmC0UuuXKsBy50UTMpw4zbTtXuRvR4ANn
	vWfyDaA47oa0+Wgd+5L9yZJIvIml9QpjsQ4xq3fe01/c6gy6GxAN1Gty/dDLJDoVCkU8Qz77O+K
	zOwg==
X-Gm-Gg: AZFdTZcZW3KqvPgnF2+Y+nyhWZ13jUUSSWHiQDkpPmmvZlkdvRIDCMvWV/oBQjLMoRg
	/12F8mUkI9phDR+l90rqh2PrDvH6BQxd032GIJEzbg4VNWER6wstk+Itsrso/korA5qJKWudaiB
	L+j8gF+iwVHNC823Fs0kqqTSQweXkyVAGe2Pz5Lue//sgm2NPFVlwlQ9LZ6K+b4bKnvrM75uo4+
	Px2EE7cZlEVSiBrJLJUAtC0eHyxfIhuawxjUqISI6i+Z2aYl5xvYeWKhcUeuXAuNU2KGkEBopAn
	9Fn+H3IzcFIx90Bc6V4jXdoGdlNBC7LRnMgKQmKV0O2shN7lAWLFvS81g9oFhJbN8GKqQaYd7U2
	qCVjn06Yoy7ak9lUR+ojYAdXo0V12DNiwBUox/A7bFp57KMQOBwDfHuAsVPrUrefcig/vXzvhk5
	s1kpmLgO3/efdK4QgevwWSC83UaARPxECg6fES
X-Received: by 2002:a17:90b:5803:b0:3b3:bd07:6646 with SMTP id 98e67ed59e1d1-3b3d07e0c33mr1865346a91.52.1794989013198;
        Wed, 18 Nov 2026 00:03:33 -0800 (PST)
X-Received: by 2002:a17:90b:5803:b0:3b3:bd07:6646 with SMTP id 98e67ed59e1d1-3b3d07e0c33mr1865315a91.52.1794989012779;
        Wed, 18 Nov 2026 00:03:32 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3004072a91.9.2026.11.18.00.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:03:32 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:02:29 +0800
Subject: [PATCH v23 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-enable-byte-cntr-for-ctcu-v23-8-67fd9db6bc0e@oss.qualcomm.com>
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
In-Reply-To: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988961; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5Dgum6JnAYvNy94FsJPuCnHsZTgptoysTqIYu+BN7gI=;
 b=1ShHKwidmmYkWB+xKUgzw/Jw2Y3OUqb+V+xbSEaF8Ffh8U89bJa1sDw3eeoz9H1yx45kKuMKY
 C7yNqqDtpVyCXy4QWjNKDYSswiheVEZlW9MQHcJ8tC5L+NyNOoKN/Ba
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfXzjhQTzz3iSkJ
 zAtctYjdpG15S3ETQu2sM04oFezU+DN8ednncvkvTM5kzyeORnSqraZbyNM7THH7OUl1a1IIaLD
 iH6cLeXGZ15YC1xpvXz3bzH+eLvHOeTBghOHi8X8nphGMr5xrDVz7BymK6wnJ+41JPsRdPX3HD/
 3S7R9ewAQJyzRqYoZAhRkRjMuVrFLDkdUDELhSYs8/8Z0p5f5ecA/guEdhODMNWulMDVUN4+YEF
 tnxOC3D/vc1y5kF/O0l3oHp9PhELNvaKpsibHQJ2B+vffA4N7PWxl+0WvvzovSvE7HFsq4SZOZK
 7zV6xZ/vaqcIdqSloz6WtStizi4puq2CZHJsGHmsKbuD2w44qXwBXaY967MmoCyz+eWnMGJAfCy
 lPhRNUP/NdWMtQrZvAPWFTYyoWfGo4eggka6bUc/IOab6AQYmO8iWwsSwqJEy+veS20KHDxSC8Y
 NlljYkY9yYg3MdluDyQ==
X-Proofpoint-GUID: iiHXMhXDHprbOjWjshT-Rqr9k_oBEzBh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX59cjrKHrEJfX
 Y4LKWk9tKGG0xYcUD4ImNAJHY/kaRlrGmBmlJDIt6LOKETco8kRT/exrlh0DD/eIuaRf8p5acjk
 SlOHtO8X7gbGZhXWLY40wBpYcJMSDOg=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd5bd5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: iiHXMhXDHprbOjWjshT-Rqr9k_oBEzBh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_080343_179737_1358EBEB 
X-CRM114-Status: GOOD (  11.91  )
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

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1fdb72fa5518..852a1142100f 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3132,6 +3132,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


