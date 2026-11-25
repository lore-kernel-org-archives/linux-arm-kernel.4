Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFBA606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 00:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hOAq5HHB;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=c1oEkTfb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GLPPAbg8ZJXtNBuP/olSVfNBE15bH+sF2xUL16ntd9E=; b=hOAq5HHBx17omw
	x9sPdtCjuG+nG7GRr4w8qP5y/CDgzS7UgobT9en5W5wPspViO9dZ2JS1YvDpIUysdvOJDGsZ7ZlSz
	US0ni0D+0q0yCveZn2Zpd3cpkSF4W3AwDq2Af0gaQH7uu5Tq7TxPtGQGe381Bs5gwoJRAPywZxGWm
	tWOOMnlk0EtKLrXhQ8wE7S08/FH8/P6VLIenewPRxVon/GwIK4KLgEp1/ZZ0OY4d0ZmbEFYp8VJuz
	C7u93NhC23TXM6fRdtHehfWR8oqP7mQ5AaQ5ZU0lxn0QIqYCP4NXNdKR8rFJ0/LogPhOFBfZseDMu
	2F8O/RQw7ABJXmC88gDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0XP-000000087D2-0vD9;
	Wed, 25 Nov 2026 00:07:03 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0X2-000000086zJ-2UWk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 00:06:42 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-38190551625so10330037eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 16:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795565200; x=1796170000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GLPPAbg8ZJXtNBuP/olSVfNBE15bH+sF2xUL16ntd9E=;
        b=c1oEkTfbVBg9a3rBRqK2e4GF7r6lK52YIRhxyrzxIitbxCuhiM4roaE5hkSzBRAr/n
         5mtJuD8geVgUkPNUE+vVq7W5rI0EpB0FUbZMdyH58EKtSn9PfilCCN3KNtECUcwG/Nrh
         19jcwedFOEocZ2xUZcJX1o9n+j0ebML4Rqka4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565200; x=1796170000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GLPPAbg8ZJXtNBuP/olSVfNBE15bH+sF2xUL16ntd9E=;
        b=KpIutGeqXAg25rWEW9YCawD51cnrSk4f4I9FvcW3BskRwNncO8bZ2PemFLJ9/h8GAh
         rcNk+qnvblg2vgkTYqqeMSs55p8FFvnvN2sWGK9mD2jqt2FjbZugPUisZsGUPall7Clr
         G73tIqDcHhYcvjdBjgnbLqUEIyDZut4hk52QEMQew0rr02DchRYJmGtV83Bju5BZA5sy
         QUy6hbI9rEqTWel+J31/LBRcds5631/Tb6ixmOrqKZfZ2NG/kgbeho+XOA6+P/MFBj77
         UEJLbEfh/sjcZ/oNq1kOrjTVVWXkxrKtfO8sPaE17LB/5s2Mi5OkyUCE2Eh0JVc1hhlR
         oZ8A==
X-Forwarded-Encrypted: i=1; AL+hErEXUbwK0DkGmdC179HaMOYZJI7VQ7znhKZitHr5AOtpco8FZ1PR/Lr/IAoxkHecSSqxCbwHiIWUhdc0Gw0Q0sC6@lists.infradead.org
X-Gm-Message-State: APuU4Z+km2IVDzoIdVgHBP4JxLZVUnnn8LpEgTpaI2hNyPJklQzFXx8t
	/J+ePU1q9A+zXvdv2lEnoSETQjjJFlxytY28WLJkHTWlZtvJa75/gyQMc340Mv/l3qpzS9peLgl
	F8Lo=
X-Gm-Gg: AZFdTZflHjwknmIo7M0YLg0NWDLDlgf0DZHLlClmsd8zE170bVCFGzbJCUmUZEMXjsi
	zkQ6D1qKIJ6M0PVorXCWFLO2smd7bji3k6ReBvvu2FNxiEAMsAypDL78m2KPyNA/YsieCOTzCtp
	nptuI5rYyMUsYe2LSfU7d4k9ihF8eGaQysxpJdAABiVzwL8QiwBMXFGGXDW7FD+Xda+BLOMbb8Y
	bkkIttgfs7hl65kE28CxZArMLVsZIQq4AWpQEwlEw3sjRYE/4Eoxju/x7AgjZzkcEivlON3jGWX
	7EZl/rJd5n8Vas6IKndmkzbAvriq4AldP/aKlDF1olxKpRuR/e49FmzSHViQbku0CMiu2eUj0B6
	lfQDPX/lRUH4pCVGcqYlCRhyPjNBTDC/Cq65Mj26WSzb+k3HxYHGCCAHcskLFRryzskrs6RWLqP
	BVP4+4SaNKnBqkPURpNPmFrk8bhgrljw02G6nlXPJeGvb9cJCsmiqMytInttGTnhf42VuXZt6UQ
	gUQhSifcsT06peYEknqo+Tpa9wLdymjABsap4l0KmLOhVmFeCqKwhGyvnEz8AS5JO9f6qb7jOee
	UVRAmLELQuo7CLRjZA1LeJbWW2V9CXuyJEbgUxyZMhPiE/Td8EEvg92ApYDS8fc54cR3
X-Received: by 2002:a05:7301:182d:b0:386:b801:cd06 with SMTP id 5a478bee46e88-386b801cd3bmr5742665eec.40.1795565199973;
        Tue, 24 Nov 2026 16:06:39 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-38566cd4efesm50070598eec.12.2026.11.24.16.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:06:39 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	linux-clk@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Mariano Marciello <mmarciello@google.com>,
	google-soc@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 7/9] arm64: dts: google: Add Laguna CPM mailbox array
Date: Tue, 24 Nov 2026 16:03:41 -0800
Message-ID: <20261124160343.v2.7.Iaf8214205f496225013f482f6e0035e89ac624f2@changeid>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261125000349.3385325-1-briannorris@chromium.org>
References: <20261125000349.3385325-1-briannorris@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_160640_643777_81555155 
X-CRM114-Status: GOOD (  12.65  )
X-Spam-Score: -2.1 (--)
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

These are the request and response channels used for communicating with
the Central Power Manager (CPM) found on the Google Tensor SoC known as
Laguna.

Tested-by: Peter Griffin <peter.griffin@linaro.org> (Blazer/Frankel)
Signed-off-by: Brian Norris <briannorris@chromium.org>
---
Based on WIP bindings from:

  https://lore.kernel.org/all/20261023165211.v2.3.Ia186a29119b4b5c409815b755e0c2c3965b0495f@changeid/
  [PATCH v2 3/4] dt-bindings: mailbox: goog-mba: Add goog-mba mailbox bindings

which is part of this series:

  https://lore.kernel.org/all/20261023235408.3063350-1-dianders@chromium.org/
  [PATCH v2 0/4] mailbox: Improve the mbox core then introduce the goog-mba driver

The binding is still under review, but I include this anyway to help
prove out a working solution. This patch should not be accepted until
the binding is settled.

Changes in v2:
 * Move later in the series
 * Add Peter's Tested-by

 arch/arm64/boot/dts/google/lga.dtsi | 30 +++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/google/lga.dtsi b/arch/arm64/boot/dts/google/lga.dtsi
index 3e670e524c4c..6ceb9ea6a100 100644
--- a/arch/arm64/boot/dts/google/lga.dtsi
+++ b/arch/arm64/boot/dts/google/lga.dtsi
@@ -365,6 +365,36 @@ soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 
+		cpm_ap_ns_mba: mailbox-array@5240000 {
+			compatible = "google,lga-mailbox-array";
+			reg = <0x0 0x05240000 0x0 0x00010000>,
+			      <0x0 0x05250000 0x0 0x00010000>;
+			ranges = <0x0 0x0 0x05260000 0x00020000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			cpm_ap_ns_req_mba: mailbox@0 {
+				reg = <0x00000 0x1000>;
+				interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				#mbox-cells = <0>;
+
+				google,tx-payload-words = <4>;
+				google,mba-queue-mode;
+			};
+
+			cpm_ap_ns_resp_mba: mailbox@1000 {
+				reg = <0x01000 0x1000>;
+				interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH 0>;
+
+				#mbox-cells = <0>;
+
+				google,rx-payload-words = <4>;
+				google,mba-queue-mode;
+			};
+		};
+
 		gic: interrupt-controller@5880000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x05880000 0x0 0x10000>,
-- 
2.56.1.831.g720f3f5937-goog


