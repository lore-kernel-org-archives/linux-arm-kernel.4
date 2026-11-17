Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F752606A89A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 08:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V5ranxCN;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IyplU1dA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aJgvoEkw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/CONjcZjTX55AH41Bp0bQLrb1YEIFyeZD5sSZFFOtU4=; b=V5ranxCNEg0F/V
	hJgqGBg/Je4FC5kLwhwICMQOzYEcYmgqbUmjaqca5saPTOpuOOVanwvu+LxfkiVLJKqy0VEkXcDUk
	083GraEiGqADDUluaRUz7FtBLZ9aPBIbyt8ePRYabYCOO6ihRkQM8l2yw8zwkutlaMKgqk2r0htqo
	QNssEDgskV9WlmhVXBQrs3wh/sl3niTWhk51zo3wpCt+PuE0cdAdiRIQuIOWOQ9QwOL7DqEQ0wusE
	WXfRYA1uxqcbY61hs60800supIICemLGRXIQR+/BKkKToUu4ElUZmEBiNQtLCLPzFuoHcNskoOqh1
	Q5naxqvcsGcbnPIfz46g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEpc-00000004w4i-2ckb;
	Tue, 17 Nov 2026 08:46:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEpZ-00000004w2v-3Pji
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 08:46:23 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6LrwD3980793
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/CONjcZjTX55AH41Bp0bQLrb1YEIFyeZD5sSZFFOtU4=; b=IyplU1dAU8whWxwY
	15GN8SqxkDSjAlPmXp2m+6+oGJ1jjHOdBBEypHzq+BySvPA9zN9YAYNVH+8hvrZw
	iyrkn4SIXCqMTCKLX2Dsiq+J6oFlDt7SFxNl9432m8DTRHMdsO23O6eFgOTyaFd+
	ndP51GqFQD0g1xkUgHrvpHjlu0uG5jJ34gBS4GohoACtcOSHdwMKquKTtN9QkoCy
	HiIy7/9VmUwm2mSL09SeIB9GqKIFHjB49EXGWzkPmDdd2javXqY5zA1g+IgFzkJ8
	feHpcFax8BRKxbkvIKnyoP3CoOqDJ/LZkXZnZpiM104qSOvxGSHHvs2BDWOZ1WjB
	p6qLGg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd0hee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 08:46:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3a73a82a1so1193547a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 00:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905180; x=1795509980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/CONjcZjTX55AH41Bp0bQLrb1YEIFyeZD5sSZFFOtU4=;
        b=aJgvoEkwBsPmXMW3MUIlHDEsg7OWQ7U7KqIFhJJ34PGOL2pEjHOxIUUnFtBo4cYAiw
         BZAU4zdEXnkYhR7zC9nS7Q4dLQGW4iSVQZiRzsgMCTNBIwm3nHu7XqKRbslZ8Zmc/od4
         Yu2Tn4BzCVFdoC5ydMXMDLFc7yO3sdV04sLhRQckSkjjp6n6VII3rHOm62ntlJW/1r9J
         2zpD1x468MVq5C2HnLz1lLS1FYANgybM28ECQr9jOO2ZJHVfV1WO+1eai0xBG8sY8MIZ
         Cb3XvPy/A5HVzW1SN0NWYsd2RWA/QCZy5DgHvT6N7ESG/45am7aJGNYDgRZHjbGUCzjj
         1KVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905180; x=1795509980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/CONjcZjTX55AH41Bp0bQLrb1YEIFyeZD5sSZFFOtU4=;
        b=IMrFOmwS40Oe+MA0IJ8ECGjgQfuMROOcbsfK/bmUUDCU3RFt7hwxS4LLYmPC7r59EG
         2qLDi3GKnE+nVgPHaD350vIIFGm5lWPSR6y9+XOP1I2DQOtHqI6xojJgs6afWdmv+P2H
         K6v/1Sj8HDHR6NDhLawmH2NgDUUEO+LGqaW6m1u9Uu7S9k2OK1olo8ZJjhTyxII6TgLa
         ZZc78sCgV9fKlLgkXRXNyEea8xD+ThbO7NdWh1+2DryNVujFMvOHg/RGklMRhqoIRdG5
         JkFLmsP7PMWg9f35xtj1sqOB5cSdKlyb8oTc95BLlJIaqoey5ymZm8Q4lN3LWsuhtVf6
         DtZQ==
X-Forwarded-Encrypted: i=1; AL+hErHoOCi3EygF7QwzGjocTvIJEdj1P1FWuBsl6clKV24PeCGVcoqYZVqkJb1aujzpBwWF3kMAc7gK729hAEo9Fo2G@lists.infradead.org
X-Gm-Message-State: APuU4Z+P61pLzdBByu4WohNZnoBDbcORE+D8OQ2u/H6vCiaAwox6hww7
	CFOK/HoSvEwmEu3eo9+MntdoCYVKqFo5gaK2M+u4UTKa4fiCyYsBRqdgC4mHrs8YPWklREpuLRX
	R8XdPyPDU5tyxkB/KY7bfFkI5TSt+TzcHDyXNwhIGRpHhN+M64eqC64UA2uQ/bMxZElJI6s09pM
	YO1w==
X-Gm-Gg: AZFdTZfHowV4WCi4RVNUg06kW6KELKrt4ucaMQ9uvGwjlxEiGqPL0YmGlKVIq2PIlHc
	hkT41z9T7sno7bjAZqMl2yiQ6lK74Q2dfIY2kw/xanJ800pyKDlDM2PgQD+OJDOGuqMbHA3SjCA
	GjwrsVZTvhaphGaO7k4oVhiqch77kcCRBJgw4dUnQ3XgXtgJBr2dK+4lW6dcqcRKlDz5NbCWbdl
	8vb5GD6bMw3YYs/uoir2AMmt79OpCd3uWy4Efrqpki+PfqkL9dI+9g9wSevw8BRZNQ9bw4jsZ6Y
	2k/KyaTPB6zE2mdaoSwOBAguZY3l+N0wNFLU2WD1VE3vk9qmaYSQVnY4r/ar0nQdr6oY+4oUGLb
	yh8+5skAKZCRrtew4yN5QSCp7QQIDNg5GwHPWlKlLib0w4lxAj7HQgj+tHDGVGqWIWHjWF33Cna
	a/Xw==
X-Received: by 2002:a17:90b:17ca:b0:3b1:fad:b1bc with SMTP id 98e67ed59e1d1-3b1b0d77ad2mr13585178a91.63.1794905179662;
        Tue, 17 Nov 2026 00:46:19 -0800 (PST)
X-Received: by 2002:a17:90b:17ca:b0:3b1:fad:b1bc with SMTP id 98e67ed59e1d1-3b1b0d77ad2mr13585149a91.63.1794905179060;
        Tue, 17 Nov 2026 00:46:19 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:18 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:23 +0530
Subject: [PATCH net-next v4 03/10] dt-bindings: net: qcom,ethqos: add
 qcom,shikra-ethqos compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-shikra_ethernet-v4-3-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
In-Reply-To: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=4189;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=GRQtM/wcadv7R+zn5eLlwrFMFCKwmZZnZ+Dq1EyLMP0=;
 b=vXb7kOSstG43o/q3shWkjmBlZAzBQVH15p6eBFVgAtPSKoZkFBlueCr7u5Z34ABx7iod2hFj5
 ZEVlUNAb9IpCpN3w6nDQ5+dEskZeeF5E3loNHtTG+i15xoo7wywUdzB
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc145c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=iZY8vWlYZPOy4iMPn4IA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX+su4dDY5wH9u
 LNqz3N3Te82K9q2ALbQvmevbRkx+khF7Ons7xXZ2dj46/fXux/wGWMsLVDVnGP5kxIny5uM3P7v
 KTqABGGwGIs7LJeuJExI6YqLepKPH/c=
X-Proofpoint-GUID: 4uTETzFxrRJnQb-Wf2ZaKOvfIic-g-Fs
X-Proofpoint-ORIG-GUID: 4uTETzFxrRJnQb-Wf2ZaKOvfIic-g-Fs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX0NZYzi5OjxVi
 qS9kJYWEtidGZokE5A7Bi1vXFaH/rB4p6clDlogcwQ0QKAty/Z6e6cuqVEBh46+tjp8l08fM3i2
 y+u5Vu/iHJmAOB0u4HLMO+Z4EX1cCYKK+nt0vy/rfQk3mdWhRKkbttfR1cGuZ1tHCMI/YjR3A3N
 cI9Fa/2KNaa4oxL+vivdcnndapR0ySa+7/cNt0jykfwTRy+/Ho8nDEIfBX7oJGfUih3WfLrXlcW
 BAFY785yOJBg6JTt5Biox3CJWHkzB9fdmFinB03PsdsSu/35umm9FuJwk51NWlWUarKPslktXC+
 VNWzuoYQQtdoj9lCCVhy4zQk8XnHgRxSqCbbK8CbdFJPl05yg5MTYblCXmpqhmFED05mpT8SHe5
 Ec7yfli8t8G414XOo1W7fgPZOiVcLYkyfFkecaVpW2jcUDhym0u5wAde2GphYXR+IA8kEkpRUZ9
 hyeAuBniE586DV+LAWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_004621_982893_3921C1C9 
X-CRM114-Status: GOOD (  15.02  )
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

Shikra's EMAC requires two additional clocks for NOC interconnect
access (axi-noc, pcie-tile-axi-noc) beyond the standard four, and an
OPP table with required-opps to vote VDD_CX to SVS when the NOC clocks
are enabled.

Add qcom,shikra-ethqos to the compatible enum and use an if/else
block to constrain Shikra to exactly six clocks and require
operating-points-v2 and power-domains, while leaving existing
compatibles unchanged.

Add the relevant compatible to the binding document for snps,dwmac as
well.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: moved operating-points description to the top-level, and added
power-domains as a required property for Shikra.
---
 .../devicetree/bindings/net/qcom,ethqos.yaml       | 54 ++++++++++++++++++++--
 .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +
 2 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index ef520f810577..6bd4bded650a 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -14,9 +14,6 @@ description:
   dwmmac based Qualcomm ethernet devices which support Gigabit
   ethernet (version v2.3.0 and onwards).
 
-allOf:
-  - $ref: snps,dwmac.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -32,6 +29,7 @@ properties:
           - qcom,qcs404-ethqos
           - qcom,sa8775p-ethqos
           - qcom,sc8280xp-ethqos
+          - qcom,shikra-ethqos
           - qcom,sm8150-ethqos
 
   reg:
@@ -57,9 +55,11 @@ properties:
       - const: sfty
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 6
 
   clock-names:
+    minItems: 4
     items:
       - const: stmmaceth
       - const: pclk
@@ -67,6 +67,8 @@ properties:
       - enum:
           - rgmii
           - phyaux
+      - const: axi-noc
+      - const: pcie-tile-axi-noc
 
   iommus:
     maxItems: 1
@@ -81,6 +83,14 @@ properties:
       - const: cpu-mac
       - const: mac-mem
 
+  operating-points-v2:
+    description: |
+      For Shikra, the OPP table specifies the rates for the NOC access
+      clocks in "stmmaceth", "axi-noc", "pcie-tile-axi-noc" order.
+
+  opp-table:
+    type: object
+
   phys: true
 
   phy-names:
@@ -95,6 +105,42 @@ required:
   - clock-names
   - reg-names
 
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-ethqos
+    then:
+      properties:
+        clocks:
+          minItems: 6
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: pclk
+            - const: ptp_ref
+            - const: rgmii
+            - const: axi-noc
+            - const: pcie-tile-axi-noc
+      required:
+        - operating-points-v2
+        - power-domains
+    else:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: pclk
+            - const: ptp_ref
+            - enum:
+                - rgmii
+                - phyaux
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index ddfc32ba29cb..b6555ada21da 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -76,6 +76,7 @@ properties:
         - qcom,sa8255p-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
+        - qcom,shikra-ethqos
         - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
         - renesas,r9a08g046-gbeth
@@ -568,6 +569,7 @@ allOf:
                 - qcom,sa8255p-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
+                - qcom,shikra-ethqos
                 - qcom,sm8150-ethqos
                 - snps,dwmac-4.00
                 - snps,dwmac-4.10a

-- 
2.34.1


