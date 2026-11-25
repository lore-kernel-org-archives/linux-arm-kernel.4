Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33AA606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rUiT2I0R;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EMCYW9VH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GDvxlFRxYJ/hkyDYpmeqRD4w+SNrEBTiATTaXGwEUVg=; b=rUiT2I0RrrvqYJ+jUvSeE28AsS
	+qYg4OtZ9sDW+ksKFj++pBhPBjHJEdNczYJRMZAsFGKhSOP8p7GFyjkTOCNWChG2hO19FX01eo9G9
	PlxCNgpx6CcWUL7OG90uEl96wIPQAZQKeAXidxvrLKikL00yM1KOvPsvswXoPPdm24/cTLYvQnENv
	zfN8K9enCVDzs3pSL5SIhqTQjiwzBmlJsxA/3DGffwbL/mV+wlX5O/fyQgmTd4Ati4HsiID9GykOv
	D6PQWDUOgAKghrtY0TIR/cIZPCLlDPi7q55xZq+FMS+GHN1Gh1l+VCIWfhehGUvNg+jZ4l8ZdKEMH
	DITTaGJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDtR-0000000A8kC-37JK;
	Wed, 25 Nov 2026 14:22:41 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDtG-0000000A8fQ-31Hc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:22:32 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6bb06dc1fffso2631977a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 06:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795616548; x=1796221348; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GDvxlFRxYJ/hkyDYpmeqRD4w+SNrEBTiATTaXGwEUVg=;
        b=EMCYW9VHAG46BU52Hv4nhqmISaCJ6nFPSjPHSNnqqc4A9ZAfhlbVQXN6+WQ25Do8fK
         XFBElmtCrFcPZ1qqGlWbUR52uH+V9Ueaf2iLiQ66Q9YElIe1JE8+hRkhG3Ul2txwv/l9
         zzeT6rP5NWYmqhYBWKnsXrOqHVu9a/lBRyLTEjiMqkieadk/r8Iyn0rQVlrAAbVdJsa8
         udaGxqY7oNO7FZHAWKoAIXk0EvFaK7jBfHTDrRPu/75bxItFoJrkDYQste/xvuZsJ11q
         LJyWk4H6f2mJz+2uSjNlQDXwQ3N3Q/0fP+8le6lxR4nPx2zrYxoqi0ePjbfRlkS6rR02
         Mavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616548; x=1796221348;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GDvxlFRxYJ/hkyDYpmeqRD4w+SNrEBTiATTaXGwEUVg=;
        b=O+BhlyFCvMl9ZPbmqgl4S9csjZiIQcwTJxAkUEt37twZSl49HJ/q1qPDX+7LCSVckp
         UYEmR0CpGnDMlslDEtZw1QPyMUhTAxiXmQNIT0be/x12wrQ4+ADJl3NLJBDW/EP/TRa0
         KmConqut/kNTtyv7xd1OSeJlEQ9Hv4y4MANWK37L+uCwtG3fAxTHyvNiC4AB3ko8UY3g
         H0qBJZLi7m/4NY/BeOepfoEw5juwbmMJ76skveETvBc2DlAuJ8rSh6B41H+qHW4Bin2v
         o7j6niYvH6dE5re/88UAXEfkzGhU0UGZHkQb0iEtp+V1HmO3nFwYAolliQ0aI6OZnLuJ
         xVrQ==
X-Forwarded-Encrypted: i=1; AL+hErGwU/CxU2o4fjeHcFjEQEqvSzyPK1le/Fmk29Dt1+77hRq/7OJU9aCH1GT7y1mhMjhg5sPBdRjnCTSHBXoIlma6@lists.infradead.org
X-Gm-Message-State: APuU4Z8RyrtWb4JwL2kaESxL/e/vR5eV3RqBJWgRz1TE20bNl/lPXRIn
	xVTLktF27e7G/0/kJx15wjGPoQMmWnVMe3YU+jZ0FV3dE9nrrzQLYI1jAAe4N7HPab8=
X-Gm-Gg: AZFdTZfT2mTPm2yoIgmg4rFumDO8mSqZaC5rmPPY6O0QyMaZgpACHswtt8el59zNzsC
	sSBZCY9QDy4NSiBJv9hkLJ+Uim8P5OJGy7f8PMysF8E0fujoaFYL7sYQtOT7sXywQIkmx4TAanb
	QkshXFAuPKgfkiq+dhZ0jie8FOUAbp3pzqv119Ndx00IQJPEgwjCKjx242Zc6Xa6EBw+2xdH+d2
	WeBxEhrXLITHJrOtnvEV2w9uSpI6we4/2IsVG5Os964lLGd69+d830PsytQ8JrF3fBvOX0JkgR5
	PurlD2GsJJpi/gRhrfcxpAE96CXfmDM32wiX0h4YZ8y0I2CznOCXC9HdU3lfyqX7jTN+S6kWGrE
	aPEpmqR2AgtwxWrTx3T6ItWIoR+BTeGmzX2m5usKyBuSR96Jih3yXgN2Z5v775uZ1dG5m0/gRSV
	xGXqPpNb9OhUO4R9aFiRpAAp2lez/0GNnrB6U+XwRUwjdcbabBmau5PNbq3Zrd0TxYgYhYxiro3
	ZLnfxlGOc2T7TELM1GekPj8vepZxm5EJKijYdMSWfPTvFfnxlQep5Ipt4z2q2G6BaU8DAbXoGKm
	XDjvbvJwviJtRnYWhjpLle02Mmu6VmjpoOQPervCIpZ+zhGORU8lHO/R8kHOMsmfBRz+XAf7HZQ
	lRW9/mowjbKMOsVnArg==
X-Received: by 2002:a05:6402:1e92:b0:6b7:d55:87e4 with SMTP id 4fb4d7f45d1cf-6ba37e831demr13309656a12.25.1795616548357;
        Wed, 25 Nov 2026 06:22:28 -0800 (PST)
Received: from puffmais2.c.googlers.com (226.124.90.34.bc.googleusercontent.com. [34.90.124.226])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm8315989a12.23.2026.11.25.06.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:22:27 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 25 Nov 2026 14:22:26 +0000
Subject: [PATCH] arm64: dts: exynos: gs101-pixel-common: add BC1.2
 completion time
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261125-gs101-bc12-completion-time-v1-1-8fed7a3a7f43@linaro.org>
X-B4-Tracking: v=1; b=H4sIACHvBmsC/x3MywqAIBBA0V+JWTfgSA/oV6KF6WgDvdCIIPz3p
 OVZ3PtC4iicYKheiHxLkmMvoLoCu5g9MIorBq10R6RbDIkU4WxJoz22c+WrFHjJxmjZ+X42piF
 voAzOyF6efz5OOX/us8bmbAAAAA==
X-Change-ID: 20261125-gs101-bc12-completion-time-cedf7baa41fa
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_062230_793637_638B8889 
X-CRM114-Status: GOOD (  10.61  )
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

On hot-plug to a non-PD Rp-default charging port, TCPM can query the
BC1.2 current limit before the MAX77759 TCPC finishes BC1.2 detection
and read 0 mA.

TCPM reads the Rp-default current limit upon entering SNK_DISCOVERY,
and the gs101-pixel-common USB-C connector node currently omits
sink-bc12-completion-time-ms, so TCPM does not wait for BC1.2
detection to complete before entering SNK_DISCOVERY.

Add sink-bc12-completion-time-ms = <500> to the USB-C connector node so
TCPM delays entering SNK_DISCOVERY until BC1.2 detection finishes. Note
that this adds a 500 ms delay to every sink attach, including PD.

Verified on Pixel 6 with SDP, CDP, and DCP hot-plug and USB-C PD
attach.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index dc908dd7e1c6..13cc8a90a3b3 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -668,6 +668,7 @@ connector {
 			cc-debounce-time-ms = <170>;
 			ps-source-off-time-ms = <870>;
 			sink-wait-cap-time-ms = <450>;
+			sink-bc12-completion-time-ms = <500>;
 			/*
 			 * max77759 operating in reverse boost mode (0xA) can
 			 * source up to 1.5A while extboost can only do ~1A.

---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20261125-gs101-bc12-completion-time-cedf7baa41fa

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


