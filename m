Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36625606A337
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cc44m5GT;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tiFRRwvJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qEVHtiKYBLIel8um/QH5PKwY2ZuAggHrE4chfoek6uE=; b=Cc44m5GTKj0bKg
	/qRm31sn7/AMZkPL5PLpmcXgpqXzz24ye+EP9/b+YI7YSPQI5Uk1VenSIWZ/lVIm4lMIyf1yOBBYC
	RaMUrF7lRGQy5WWZEEEZ0Ekl8cZciho7nQD6SnlFAE0odKnlPMWAyLSr9HF0qvwRJb7lxQ+bAhg+3
	bDfJxzurhLRayYt8jMV8jwc8R3zhqQFTkQtL+P2L657LAPOuCmNgFbnsDW9ZBZQbrmUd/+5rd+0+N
	uORy5XIisHDuZc0bC+g+XPaoHXm49EqwZXuh1FOUO/QLTJU7r0Zc83/JqOoWlGfenq4i5aCLR5EoC
	XN1Wrs0s7iwp3JIZQjXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUBU-0000000G4Ae-34Pl;
	Fri, 20 Nov 2026 19:22:08 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUB1-0000000G40b-3PLj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:21:52 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so18992335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202498; x=1795807298; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qEVHtiKYBLIel8um/QH5PKwY2ZuAggHrE4chfoek6uE=;
        b=tiFRRwvJQ1RfN6qlRoElbDW9FaYjl4al6U/CdYComqhOadg2horLtGB851GF28lamF
         gwNaHInOSRAeKj0plOLB3UxdsEVsE9QsLlEZYm0iOVSosw5yt8iNQ+Wbelep9z51GMTr
         GTR+pvzK7LCsMkzId83NYqd2DsJrNFFr8Nn9uUkhbSq1xgZOIei4utxePGvjcod3GgMl
         2A4yCVwKGpf1LY5XYcH967mnXKxADou3xQUqqNNaIGGTh4rvqhp+5jBVEsKuioGNQvmA
         HH1IftO1T5PECS/HyiF59LJplDraPQutTlC/bMeBWMZB6HkWOyau4yZKm4Zidtm7udx5
         QShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202498; x=1795807298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qEVHtiKYBLIel8um/QH5PKwY2ZuAggHrE4chfoek6uE=;
        b=euuZxMearDm8aN+tAyp/OTF5yQ2qU29qvCES69h5pEmMWlI6j0rHIJcxP30n1hWVRA
         HbCTIK3sN39qBHrJMxcufVjmwkEXXdTmQMDH77mDK7pehUp6+FmVo/islPfjuWD4g3NT
         3277HnCX7XpbpWH+K17kWXJ21KxEjMfTJ3cEqnkHjhF7DFMnhUoDnsrMuUID9NKWUNAv
         gy22qnNXC1zSvzpw4+lwLkgCwHiMzZR38ibBPLi6K3eVSpBpl6ytaXZgA4dAtnXY1H26
         7ksuQ68lJ/ppaKPJIRz6QeeG5FNC+U0hOXIeLhal60rw+zWG3KrSTo/O/Rhco3O/dlx7
         Zjag==
X-Forwarded-Encrypted: i=1; AL+hErEiD3be7yrnUYCE5oEzk4mt4koG2t982LTLy4qE+zBcFPh6qS024nZHdPypMbpJ42CHfapGLYx8KJzB7KuX8AIh@lists.infradead.org
X-Gm-Message-State: APuU4Z9PEKhZ0QEeNKARp6yXFreq+boHyacpn7/OWkLE1b8yya9Y4mwv
	+jf1/bDHS9DnpHtdAlLqzoGdJXg53tOw1BzjqHEHCHAinrErezOtux7B
X-Gm-Gg: AYBFou3NcMof1/i96nASFQDht97/01YpZAKsqKFiEtwFexw1WAj6REConZyh9bZJ6yq
	I6bMTNZJ6Iatch4rO3uf5sLugRV8PmBo4xjFy/WbWJicMeUB7fakO/PdeuUbVFxe1iAe3IgxLzq
	IFE7wwD/XQsrfRllW2QPvO0p23F5hEZ5lQmeQQ5KPp6R8PSvQR9IeBY7xZOd2rbImHB8N2udSXF
	aLJ8uErjidVkvdRyRMAkE4FuX4Kr5rBU3ptGf67Yns+mLPdzMerknSo18tOWagDEWkTebKX+X+8
	D/hVnfIG3x2NNO3pgmie+MLJUM8CdCGcfn5XJnELD66JXOBxKOnhcla+RwXCDDPfYanzAiVNr6q
	NrF1TFW2SoW01HjSczUX1I1D7SFGMHdWVksCvUz+9N3d+VSfT3RqKmihpfUO12NQQO+UsTz/HyY
	qFTHjjs7SK9BwdUHH/acQLWGQYN9NkeiVezq3dOYzQAWqTcWmE1wf3+U9r7H3MnMhtWH+JOEvKM
	0dky8nu41cD3cNg9VjtmimJk4yyc+emd0yEpvwUrasCpL8vYNIRYaOnPrPphUD1RFxQO9uX54WV
	RDXMIGoVyWgvzA2AuAiyz9C1tuaIiHX6VCCx7Atp
X-Received: by 2002:a05:600c:a085:b0:4bb:85d9:156e with SMTP id 5b1f17b1804b1-4bb8880fe46mr94748195e9.11.1795202497703;
        Fri, 20 Nov 2026 11:21:37 -0800 (PST)
Received: from [192.168.0.2] ([197.250.160.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm8405703f8f.21.2026.11.20.11.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:21:37 -0800 (PST)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 20 Nov 2026 22:20:55 +0300
Subject: [PATCH 6/6] ARM: dts: zte: Declare the HSIC controller node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-zx29usb-v1-6-b0433258e51b@gmail.com>
References: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
In-Reply-To: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>, 
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev, 
 linux-pm@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=ShJdMtJccnJuS9VlQL1+Bdgxlkv6uh6Giop1oqviKs0=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBrAJ2XBrdRPG9C3eFKyU7PnA49Uabdls/WYzMcO
 WkzRMyqm46JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCawCdlxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiK5Iw//cCN+OqmdHZIesFYbXSmmMdBzwCEi/5E
 A++ezMAgQAwIgDawlimHqrPh8v7KOZ21+gTKfEh7ncmonS3duzqqXvwBNE0ZWZJLuI6VB8oQrxR
 Spms7VnDkKnCWCJY9lwTNTZHiR06DLnlF+2DrauSlWa/6nEsPpIeO5t7IjWkdMC82Nx45kt2kTi
 CRIMWib3xl/OUol5GZ0JplSVHjEeawQNpdTHI9+iaGClORXVFFm6BL5FN+h7/OCFmRt7iqFhrg7
 3637vNdQgvX0WkYq1tg/tCsBt70ZDMbsgxdrD88lrKg1DvkCToKB5r5+KK2TlKEXAz8P1c6z/ug
 4R8tFWrCZxsZkzFTb1a8eLWVt8/3dI99n+163gd1Zu+4t3/AksqtGaMDgXA5ERJ2shUqZhFs/Xb
 q8G4njYOSnTSmqKoYENf/26Kw24xW/ttjqcWploIYjRp7vR82311DAoRXKTzhKZODzPbWYliMj4
 RJtZCS3ZazBCo84x1e5pyyQbQV+tcj8HuVm5jSfvIf2KqK6q7TvAYnooGaIrQo0Yu4LscP8xmwI
 ToFA0xXUfKHLdUVApN4c9tawezCexUY6fasofMNz7kToQ4wuTsKTm9NEFut8zjOFqv5m+xBpEAA
 Hrwn4mejfFyqzdQpJuSwZcy/rL9bARrA+TKCmztVmIi69bu2+A14=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_112147_750198_6A6845C9 
X-CRM114-Status: GOOD (  12.19  )
X-Spam-Score: 1.2 (+)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is for documentation purposes. I have not seen any board yet that
actually connects anything to it. On newer boards it seems to be removed
entirely.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index 2fc888b10006..56d6b46a8ed1 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -199,5 +199,24 @@ usb@1500000 {
 			phys = <&topcrm ZX297520V3_USB_PHY>;
 			phy-names = "usb2-phy";
 		};
+
+		/* The HSIC controller exists primarily on older hardware, but I haven't seen any
+		 * device that is actually connected to it on any board.
+		 */
+		usb@1600000 {
+			compatible = "snps,dwc2";
+			reg = <0x01600000 0x40000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topcrm ZX297520V3_HSIC_WCLK>, <&topcrm ZX297520V3_HSIC_PCLK>;
+			clock-names = "otg", "utmi";
+			dr_mode = "host";
+			resets = <&topcrm ZX297520V3_HSIC_RESET>;
+			reset-names = "dwc2";
+			power-domains = <&socsys ZX297520V3_PD_USB>;
+			phys = <&topcrm ZX297520V3_HSIC_PHY>;
+			phy-names = "usb2-phy";
+
+			status = "disabled";
+		};
 	};
 };

-- 
2.56.1


