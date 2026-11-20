Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7B7606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 03:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bgbay5aF;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GDeISYqx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UfJb8W1/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=Bgbay5aFa5h0Ix
	2+fcLhIzQy7fYtgjPjMUgJYxtRXJjPaYzmaunC2d5IzsnDm4L/YL/1nCcxxTFHvmkitqZUICNpHWe
	WW/MLDoFn70tZl32WcIQ/1HS3n6Rx0oXFjVMDDXNNfFw5KohnqM372R/SVytYDcUVq95m19rfZTOs
	YjDdLrpjXXmOi52+oqjcjus+JaSVGaVdtyEIXUjeUWoZkcnIGnd8H9pR/p0NQqJrfo6tcLOHVGQu/
	cVJlp7L4ZuuH8K/Sb4+NP251G+sdbEKQEnP8PULygsoflGzp+IXzAFcMtRUWCWKcuTXoPYnezBUH9
	baGDbNGQB8SR4rNR2HuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFIz-0000000DxzJ-1SXo;
	Fri, 20 Nov 2026 03:28:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFIk-0000000DxpX-0jWo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 03:28:39 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0GURl1049027
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=; b=GDeISYqxhLpiI6ZT
	/h4DSsdKrFb1/tGHg0KZEKVBTogTGlp5Y9yFstQKcw7FV70qzlJflik0NpvQpb+w
	2myyabskudEXvvVQZ+3lZmbctOif+sFbr+m/QHoT3YZM8oafKTc0BIPzGSfcF/wK
	bN8MpisJsvqUlllFjs7gp39eeawYaRtydA0EcPhm84CYCcbJS1YrdhQ5DFE+kzPr
	LKiZKyui0dbacYuSCzVjqdgyLoHw3hn7tZbldtYHILiUFPCddLKN4olbLB5YEuPV
	TNdpcZWHBFzNFtAPOMNE8T2tPlIfjUDEir31HGNON+dQ1p22qztJTeu/XcaogiD6
	JOsb+A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xymmadw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 03:28:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b191f8a9b3so747726a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 19:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795145317; x=1795750117; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=UfJb8W1/+oIk/T2SjvPNLmpcxSNRPnTK29VkI/Cwx64wWp2GfAEgnx4tt2HtVtus/u
         Ixfsl2m+s2Wpbt3UqU0DLJK9KHSy11aIkvAgU3LumM0oHtLyaDQU7MH6l+QfNsrdONca
         833dYrZHM0GFpalgSFRNMVfc5Xkvw9sQItThb0LguRfLjkuSeMTTIvctGEKkMfSJwKBT
         PJptQIcZ9UCaU9T4/9j61OYFKDHYvVH5ka+WPUAjAYwO+2G7wV153gpfTJxv8CA9ovWU
         UG4jdmNQZHE1uQiM34JCkDE9MFQOxG+ix0hsFlLTGTw8i3DMZTUzi+Tg0xVC6RtMufUs
         YDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145317; x=1795750117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9zEkxrQfNR1q9vy24NZ6tm/CGFcdJf9iqlFemBMKH4=;
        b=g07HQT6bK80xxuksIQkt7Tmb++B08WGzA5PU7VB8QFdFul+wUrA+siz3Fh6su5fzZL
         CNfk7zWWgr63XyGyKhXqfycH69OKRssK4TtJaL28aHhpIt3McGfor8kJrfpI4RpADYuf
         tqQa+FpoIBEPX7SSy7uaZx0sWI0TShOwNcPnpK0pZsA1aexjn5EZ3117dVbpfIBU4LUW
         Kcb/OT5r0qUc+SKJ0hN/kKeCAO5oZCOuntQAY4rjbkjXOr0th0IAa4JMOM+one1VaeD/
         Tj9xCzsg56X8FriG2Vw0U5IR+h+mi0UKpZXIDhFH4ANb74SS4qMM8t+1UVAEDQxtert9
         vbRA==
X-Forwarded-Encrypted: i=1; AL+hErE+dYFxlUIpyOKz1eEcTIETVbagTIJpzqakkB3wjo/Tq5CFNUOFzgy/aS2EuvRy0Q/tcH6c8Cwu226vZGbusSJu@lists.infradead.org
X-Gm-Message-State: APuU4Z90vLVjC63xd56jsKwQQ0BoE0IDsbcTpk5YXw/t9/91hQSMJ9x+
	n5GsnyrMvih/xsmh21rUTn7qat0AkmsGwFSLSVQUdbzFDhVi+44dHdJxTfu3FQLaj+2oPHbWNx/
	bx5h4KEB3TXXCDqLLx8Ufn8m5MK8mlLFiDbf+W0HGPk3RlpMtPb0Ofo6Qk0tHOFBfFZEaQjzhTJ
	6aSAhaktezp2dx
X-Gm-Gg: AZFdTZc/qdessla/JGGlVT+ZAfSge5Y5bllPdafGpE/NsYuCMZ0lGYekdb3ba5sjQuj
	tdjmp9DfPtLdpJkiU6xc0PkH04+7XT2gqfyaAvUB7Ce0mD9g+JUv7X4Omnx2Z9srfgfqbzU5Ut9
	Rb0l29cjM7yCDFKS/3xU1kEh9vqK8IFD2J72B2ippsVEoVPDtsXaoDoNZrivi4DyEZ1GLsiNhyL
	MDyzCnOptao6SLplj0oAoIVbkJve2G93tdebHS0wCkJA3FbdjI9+LI3NgehVtq0OVc6v1WhFFit
	L+rLIDyKDSWPLd5nVNjp0xiFxUa1HyzQuDlFROsGFnFG6t3cqp6q668u8Z4YSAcaLSrFtam8qFv
	N8yewce7411sN+1oNSVdtuuUJITar3C1DJbkWJfDGTF7sgfwjN7dUrfdNN/mxw9ylxFUG2l+QFX
	4PBDDi4qqqL3fuw58SfxcS92hEg50udLAchlg=
X-Received: by 2002:a17:90b:39a7:b0:3b3:9ce9:f747 with SMTP id 98e67ed59e1d1-3b41c9b2d4fmr1408356a91.19.1795145317137;
        Thu, 19 Nov 2026 19:28:37 -0800 (PST)
X-Received: by 2002:a17:90b:39a7:b0:3b3:9ce9:f747 with SMTP id 98e67ed59e1d1-3b41c9b2d4fmr1408334a91.19.1795145316683;
        Thu, 19 Nov 2026 19:28:36 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm5278297a91.1.2026.11.19.19.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:28:36 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 11:27:27 +0800
Subject: [PATCH v24 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-enable-byte-cntr-for-ctcu-v24-8-2d792c6b4819@oss.qualcomm.com>
References: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
In-Reply-To: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145263; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5Dgum6JnAYvNy94FsJPuCnHsZTgptoysTqIYu+BN7gI=;
 b=u/eNLPiVv6GIj/TZvX/nOtN65AZ7hldBM0ZBlHkuJ1IXZjkOses6gu/4+KMJnP0y8AMu8IKWV
 ZuDjkVOffhjB6SFchqtyVHPdp4eVjrvGCoWJMfiwPCAs1uKEM8zh1ZO
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX2tFNkrYJfnDh
 8CGQtG8MxlFwXTSTuZqwAC23voveTJ0gMJNUjlwbUkKmE/nW9nu3u/HnQRAB3dBMkupUkTq0oqr
 m3of+6gyJmWts4iNznv83iSeN365GQI=
X-Proofpoint-GUID: HcpLaC9he1Oh6_TbNYiiLyCvsuTQXo3M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfX2mum2Q9mc8fY
 003KehXgYb7Kph4s23yaZ5x0Ez+LmBqFQ1/Wah2ib114TL+t+pLZaMLEOSxsMWe13IKpG/Z+8ez
 pOmD2HGa4rLJVfOxg6rXfWicTGPAPPGcY8QohIPbsAHpBbxFYQOV2TFPWBfz1vU67LnRScMhVz2
 cjVJpHGe8SrmIEtEXCl9eu+RKHUPFBcEypwNkcjHFIg/lzb7OiaZm3bc1IgNyGpnxCDEh1xsPTE
 IIynocZ0haXvpWQ9wIF9EDNLVHvk44WLc10K49IJMYuu7vXHidUVzAHkcRPj92yJKPEgp0xLQoO
 Qg95FUrnDbTkpI14vaospqTzz+cRVO+Rl/7S6wOrSRljttXS021TJasTkWV/PUY9QLm9B0PdC0/
 lQke+Md55S3eEh5s4y3lxjT1NpcWPuFVH9YWIuQZQ2xPvnfV5IOvJ4C3g/9vCrtOEGp3yFnEKAO
 RT04D6JloO1rMcex8ag==
X-Proofpoint-ORIG-GUID: HcpLaC9he1Oh6_TbNYiiLyCvsuTQXo3M
X-Authority-Analysis: v=2.4 cv=WKPqzXsR c=1 sm=1 tr=0 ts=6affbe65 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_192838_301938_63171CBB 
X-CRM114-Status: GOOD (  11.83  )
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


