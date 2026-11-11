Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94245606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZL+JcsRB;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NnOpbHUN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cFxuh1PNIKEywo18Tfv8aFf+JkQMs0pwqiuaLoQb3k8=; b=ZL+JcsRBWshztjHHlopftcWHm1
	RY1Etmu+Sg9xQFcTcOdlhWho2wx0Ud7VcvN9qDGGKB/Y7AiSWBU8jN3SNqXwiRYN24Pw+U1srhY7Q
	1SNmY2cn64kKKzADsF+y60hUMnK1v/Cwchgu0SoOeakrWOvbayHDVV7VAwvA+nJVTL5lYdsIcYqzY
	p7GkQZS882Gt89bHmcGKkm1IE8ZJ/PpECWsXC+kcBhrEOcVAKywJKhD9qZAvaD2DuhQtbUXEgLvfU
	X2yNncXt+OBkV3OX8HqiJEZFV0fmuzegvhcdVjQHsUQubUrFWer2DGtHtSFSrIVbwnoof71jc4FV/
	MGUL9iaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6tY-00000006YHg-1lKP;
	Wed, 11 Nov 2026 11:53:40 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6tT-00000006YCS-0w3p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:53:36 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-49187ad6a72so2152186f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 03:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794398011; x=1795002811; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFxuh1PNIKEywo18Tfv8aFf+JkQMs0pwqiuaLoQb3k8=;
        b=NnOpbHUNvuMSijM69bfZjxab4vRytO3w1QSJBeo+9ZxP0x+PV4LrcFNNWP0y/BVDBO
         4JusVT+7AOadByAwNbQpnir0Egxsivf6WbrnJz6CvkehbGI8frMB70slkG0xCONCwJe8
         s54+f67YQXmSMSoXkMo3GATu8hqBqqXD4dZqVfKzJ2epcsSv+AmSJemz1KliN7cA9Rj8
         B9mE9vLqDgNPhLvpmSZdCT4EvPuG6CL2lbLb8l4l51Ht7DLiplGckEEMf9FcJ/vgt1pO
         hWHJCD+i11z6rXcO8dnQnbAqXLAkGoe/wnGIs0IhUlYLGVOllY8+uLgV983FLpbR+wAZ
         g9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398011; x=1795002811;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cFxuh1PNIKEywo18Tfv8aFf+JkQMs0pwqiuaLoQb3k8=;
        b=S4Rg/Lilk+y3EBYpBL9PisIS7xIQ5A7ZSBjVcuiKpt/xIWOZLvNZ337A7rjVx5DhIJ
         yJakJTFuQoEIm/5YuOst6Wby6p/5ifG38uwkT14gkXvQZFiKEtV5o8fEgFkvRbpAwLgd
         2doTxAmC8TgmFAMsTdWjlTXnHzqC0gkGcaMuJ70/ECFPjAOaHAhPlHiSlVSFEnscIjnm
         rQKzp15MI9s0oG6A9bqdKBUuycme3qnPdlj5m9APwCvCMJamlpZGytSwp8QAxzlmoWon
         7UBkehDXhF/aoiQa1H6MJ1508OuaoIEFnVospAGdwOdHefWDGn6THm9XlLTP+kfZnLRa
         EbTA==
X-Gm-Message-State: APuU4Z/Cht+md0A5V7ylbAAIxvUpPVT2Ldcl/cV0Iq1cvU+DJ4orCXTH
	gzhyC7TXfOoTQso17Nv7eAaJr4gRqVrwlKcWv4llLdsOGHVxyA+XUu4bbhBfkuyFg0JEZo+i2Bt
	6iqN2ZW7JOTzex2PIB9rzgbdNkQHRrSsD8Zkmik5BrMEBW2hUJ+cuUJG4byUoxMhN69rFWLqH0t
	2O1nbo/9HUpshqrK1gOdBXJJQAxtw0FXee6784XWP5xs9U
X-Received: from wrbs5.prod.google.com ([2002:adf:d005:0:b0:48d:f346:cfd5])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4a06:b0:492:5ef7:5d98
 with SMTP id ffacd0b85a97d-499c83c09damr3673566f8f.38.1794398010607; Wed, 11
 Nov 2026 03:53:30 -0800 (PST)
Date: Wed, 11 Nov 2026 12:53:07 +0100
In-Reply-To: <20261111115303.3749380-9-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261111115303.3749380-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422; i=ardb@kernel.org;
 h=from:subject; bh=gky1cuStZY+PKkODphMTNkJfxP1zI/LkXCzNIngy2Oo=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIetLuIraBafO/3uCxL6HOTfI/Xp79PSm7ad3PTnAGGVg/
 6vvwO32jlIWBjEuBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCR6FhGhha5aTIy8d42e3XZ
 nM/rRS3raTXYXXPq6rtEyx6pW5nqFxj+Su9f7PiSW/ZYn9mEI3NLeQ9zXdnpfm2p1qtQi5agayx NzAA=
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261111115303.3749380-12-ardb+git@google.com>
Subject: [PATCH 3/7] arm64: dts: qcom: c630: Enable DisplayPort alt mode
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_035335_306368_2AC802C1 
X-CRM114-Status: GOOD (  12.06  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

The right-hand USB-C port supports DisplayPort alt mode. The EC takes care
of entering it, and ucsi_yoga_c630 already sets the orientation of the
combo PHY and passes the EC's DP hotplug events down the bridge chain. All
that is missing is the DisplayPort controller, which sdm845.dtsi already
connects to the combo PHY.

Limit it to two lanes. That is what the PHY provides alongside USB3 in its
default mode, and it matches pin assignment D, which the EC picked with
the monitor I tested. Four lanes would need the PHY to be switched to its
DP only mode, which nothing does on this platform.

Tested with a USB-C monitor: 1920x1200@60 over two lanes at HBR2, with the
monitor's USB3 hub working at the same time.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index a4a573ea7e4a..0645ab429177 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -589,6 +589,14 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp {
+	status = "okay";
+};
+
+&mdss_dp_out {
+	data-lanes = <0 1>;
+};
+
 &mdss_dsi0 {
 	status = "okay";
 	vdda-supply = <&vreg_l26a_1p2>;
-- 
2.56.0.611.g1030f0b940-goog


