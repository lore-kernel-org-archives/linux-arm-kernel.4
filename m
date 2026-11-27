Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BBF606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rzkRxXVY;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bPBsS79E;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dZASY1VW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jS9BluJCySaQDiQCJg/b5xIv0etaVg+CtYndynJGMRY=; b=rzkRxXVYG4mCL4
	t5rNmGndBUyD8eiJjgWCQGuh2DIJHwmAP0+5Q+b7LMAuZr6P01+G1Cs9qZ0pFR1h1Iz2Zg5Ehsf2z
	P46/C/4UxJ3asASBB2Cq0EDbfdEQK5HyDwOyIXMByT+dPQy3YJZlFVH1Y8zHXozDpfTcuULZtE/6i
	nl2/ivYAP/TgPA5pJKH9jLraiUHqN6eQZ4dxsB+KyIqBtjYro72W/yebGtkpc2KHSmEQct8mL7QO3
	i8xk33W2xcsgUyDuQFOKj1fRnS2DY3IQP2Cv0joXQBdDDxycAVQKlu7oCa5b0ZxKLYsuTzdY8pAUr
	HC8wnzZj64sMXj3ZVtTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwxj-0000000GX76-3tgx;
	Fri, 27 Nov 2026 14:30:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWww8-0000000GVIu-16zA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:28:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1PIJ1462702
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jS9BluJCySaQDiQCJg/b5xIv0etaVg+CtYndynJGMRY=; b=bPBsS79EvMz4ITgt
	ZIE9FSOFkFramLP0e2R0p2Nzd8F8UO2hZjbGFGgTr1PNVQKEZeJVZEUyVgqssqB2
	kvwbvJhN4IzWO+rF0VZTPPUUjwVmkv6oFAbNJZXEoS5BqTQseEqiRum6Uc9YvFIJ
	asWiZKJGLGkumLuTcUUS8qIafHn/sGvCZOm7+IxgHk59rd4ehGDLqE7Yf34j2IwC
	7iKN4boWKj855Whq/gkD4wxbvXMrHU60QCkhXmqx6MyB+uXgi79wIMBo8YQOZr7L
	loi56rLpUeOYoFI7vNYAL7bKS5uZMkAxFDDerHuHAUlJk/NhV2lo0WMkNIGUJkD5
	eZurVg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqmc66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:28:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f0717e54b0so57896195ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 06:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789706; x=1796394506; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jS9BluJCySaQDiQCJg/b5xIv0etaVg+CtYndynJGMRY=;
        b=dZASY1VWgQ7lLNuZIfdT8E6A4waHpIePpjNUO8w65hUpXSW43UomrwPa6SfDTKDHfI
         GfNt920RX++9Fg7mMZdahnD3xuYPLya0eneoSs3FgX2/mP843k7IDwtevt8X3EIaTuMw
         Zkwe5aOKNAfSRWyirgY8JYMKKUm/JiGkmne7VB0swm4K15jEpPKq1x+s1awkDAcj9tIW
         gkhO83OxE/OEpt+9s3ThYD8ogGPKg7BAR2NqmPMMJ31r8e3GQEqNVuO1X4sxDQ7XLzYQ
         luEVwoUdeHYaN9IYGRTZUk6TW/cLrZRZWH3MBNFPL7FeEauwUa2tk0tGQv5xeHcDzwjj
         YFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789706; x=1796394506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jS9BluJCySaQDiQCJg/b5xIv0etaVg+CtYndynJGMRY=;
        b=yQmzwIchwzyG+zb+PwY+7gndTpsailoFqKj337BLClUo0pVDiDjs1tCh4hnQDSsI2w
         LL6eF8lAXEU992PZFGpCYLdwlB5VwBZK1nX24aSIcNswfXX/8A7OVqycbcOHV4nipDb0
         xN2ZhylFSPBvfhQd8tPjhLcLPNqPtNq9GMY6ibl+l8zgzZNaSI2qyiK6VyaV+PoXryL+
         WKGYAnVrAtjvJTH0dUr3fVwWymJlARQM8qJzwkNsi3qTA+UcKVfqvwIUVvUDitwf8WT+
         lKPOfYlbTTTSpCdQDyVlZCFqWaF7SFdDvbbZrEZv+/mlRlliMunBexfYAplaSyNNYmUe
         2plg==
X-Forwarded-Encrypted: i=1; AL+hErHJROqliF0dDNaIqZFJh4PyFB1nVUgDlf100TJFqHq2HjonBMQa0QKlHgk1u671ZyCuNHJvwvHMlPeX+C+XY/gA@lists.infradead.org
X-Gm-Message-State: APuU4Z+78v9ELoFSe+FSXE6k7SRt+5r98J6WcbuV33hGjcDeBPBCARX3
	WjuazdsuRVSFsNnj3vAWGq2KQBZq2jXqyVHybGtUwU7QA2UeU4fPsZDul72tx07GpV34GmZqK7y
	iye8Y0NpUcFuVHtbioWWhjStl2RWD4KjXZrMgfZGQ++zNfps5E45CF6H0+dQ6GhSzenpE/2vj/g
	vIAQ==
X-Gm-Gg: AZFdTZdQbqYjezmH+v/8lzHo1iUY/T5oxecj8LxSHbsqBffrc3/ykWcIcGvE3KtnWaz
	YGVcNMsLmajqNSej5yQXvuC99l3w3JCnHAaWcYzKsVRuh0WJZi8Wl/jHXdU3roYnX697EcmsLl6
	DvyJaHWnFf3B8ovB4i5gst1BpQahkbHmLjfLisQv7KVhWUvKskh4QFbKO5dulHIi8UuP5hoYOWO
	eWxB4maAyDIE70NW0oub48/HYMVrhBwK5tCpptqOzYZOJ2KTA7/7wu2lZVveZxw+wCoNpkFrOn5
	Qrqn9RekGWWb2w051sMaCOqptl6Htdje2ZaZERAIS5C2w7fw05QJdH4EUEjgK4ULnMOYron7ptW
	N8Frd6wbDfYEa2Ne1zthfMOdNw5QkcbAbnDjRX3TguAkmCwbgpoWkzqDlXHEWeTFn+nexz80iEB
	FQPtgs1lUbHA==
X-Received: by 2002:a17:903:1ac8:b0:2f0:a586:81d9 with SMTP id d9443c01a7336-2f0a58682a8mr170116135ad.50.1795789706120;
        Fri, 27 Nov 2026 06:28:26 -0800 (PST)
X-Received: by 2002:a17:903:1ac8:b0:2f0:a586:81d9 with SMTP id d9443c01a7336-2f0a58682a8mr170115435ad.50.1795789705484;
        Fri, 27 Nov 2026 06:28:25 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm120324055ad.3.2026.11.27.06.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:28:25 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:57:00 +0530
Subject: [PATCH v28 07/10] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-arm-psci-system_reset2-vendor-reboots-v28-7-da05a33b08d8@oss.qualcomm.com>
References: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
In-Reply-To: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795789617; l=2209;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=0YQGDiz1F/FLEBDHTFy0NPa6QbvpSRgMVp0jR7EbIWg=;
 b=hH1f/4RdTgXXzUD3HLooxCXl7oj1YeLziyFQ1gZrW49x1biAd1StmoVIoK3SxAEPlFz4X4Fht
 FHtkMV+tGSPBpLein2a+YAXPEHX4HXgHfK3UpVGEududkLK7ut2VfC7
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-GUID: 6QbRKT9eMRUuwpL9-tip_r8qWYoXuHB9
X-Proofpoint-ORIG-GUID: 6QbRKT9eMRUuwpL9-tip_r8qWYoXuHB9
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b09938b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX3ljc1sfQNmjB
 LPSbtOdBd4mtN6QhdkagasShCbWe2iDq5n26a/weDPKApraD/Q26jGwqm39Wdm97yg0e/NmrsL/
 YY3X5AOEfNJE0D+PQmZPaoXMUDU7Umg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX7S28d14qys9i
 bIlBDFc8mmgszLOGN8fDAzMHufb4d23agUxm4TkecP2EqrbFH6go2+pYpnYXTRfp/YQRUXb8FQf
 APFqfRuBQXIs9TB0OiWtngKCh0KaUewffIeIdS/NZ5XT5fJtxulBLeR/zxX0m3ZNVBdwvUe5cXP
 cj3kshRsEV7EQHhcyEUKiQT1XknfjcYIROTLqSiXEzBuKfLjWmh6F/W7/7cmlAxBkaTSZVCwLMC
 O2Q7RYDP4Vkfp1z2TSabRmUtQ4L9gAOmk/fWBNs4rZDfXE2OZ6kPpVcU03DPUOkcYFGc4RVPbrX
 KuDwH4p0uc5/VA1Ys2aejxxr/LGa/h0xtj+mTovUdOQx2s6aW61o6mQvuFcMk9OZmoOEq/FopUR
 v6fqrwkf1DVwz0lxxm6LeLPeDFrRGYVleP+1nW118AnNaKWiKe4FQEW6YYMGlp+sIcY7wIJcOIT
 Tsm/eMHs9qKEQ5+Uf6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_062828_355490_0140134C 
X-CRM114-Status: GOOD (  17.48  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
for use by the psci-reboot-mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all kodiak based boards.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 10e9a5279ed60..f1c27f9769fba 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -876,7 +876,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index cb90a83351c30..501e3c0d14028 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -791,6 +791,13 @@ &qup_uart7_tx {
 	bias-disable;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 682bcbc0b466b..3c05ead3a7ebb 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1136,6 +1136,13 @@ &qup_spi3_data_clk {
 	bias-disable;
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1


