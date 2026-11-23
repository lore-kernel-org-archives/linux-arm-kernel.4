Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6612B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vm3DLYT5;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Hw8yo1Jr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dVpb/d0NeS6UYqYxsqJ8S4KQXTpwpYznEVjfCaru5aE=; b=vm3DLYT5D+kPHo
	AaKHGOqvInRhia/AcJTr2ebUPs14z6HXFxp0/peb3x/Z3WdnnxJkdmjEYo5W9bGHq2B9cQIMiOY2j
	kF2DtAPCHQQi2AuKtR2XeL1o33zRSGChsVsWw8Ieflbr87dPb+dG/1j8Pbe5/FKs2kC/zo/mXn96k
	698/+4EpivRoxSjB0GQHWCu/tvQK1E1DcApxv71xg+MCRc+HIep5Rz0HqO4olPyCZIGLouR/Co4Qv
	QTdBYh+nUP0yQoYV+b2i9MVhwBAeTApgsSs29OsVeLx7BVQQLTcbFhziRAG1iWe2y5XehUMg1sIto
	91EE2F5mlpiSKCNAvthw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVrU-00000003wXp-1JIg;
	Mon, 23 Nov 2026 15:21:44 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVrO-00000003wSK-2mtC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:21:39 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49d05d51553so24844775e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447297; x=1796052097; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dVpb/d0NeS6UYqYxsqJ8S4KQXTpwpYznEVjfCaru5aE=;
        b=Hw8yo1JrcZH0/uGFce0tE/PKvanfaV6VDCt2C9rczxDZO9JQQndoS5CHHYo1nswYk2
         jrEHpJmImU8T8t5z8zZDpsOeZuJnjOr3rSGd169Se3YjSwZXZP4O6vdspnDgvyE3wsWE
         XlRpasxWeABl2sjwUTZB0bolL+o82UP+22zTqu1Q7/F+22fFctbUcZmWtgtWNy9u2/ec
         GIf+mBaPLFFN9rdeDwF13X1KsugnA5XstOPw3rV/XriLHp/Zafg/vDNwAxA7rI2oESwL
         MEId1i5zfiMlKdHSDSNoiqTeVjtHUFYGs/vAxdia81LmxGO/6qGBnXIp1HGi3eQRsTmr
         UJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447297; x=1796052097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVpb/d0NeS6UYqYxsqJ8S4KQXTpwpYznEVjfCaru5aE=;
        b=Qc7MOaS1TsM25YJWztOywu6T8ayoMV1MEcDBLd5PM5PPcjl09TBsaaYg7JKoqiN9Tb
         8FbOFP6/NNJT4+QPDOES6Yx5xdVpNT9qORw477C6JOY58wAsysx3akAJW/yIAIGFCxuo
         thHl+gTdaySK8oIVaqsF5IZ4DG289FMWP1SLHDj4OYTR+6R5Tg3oVPEdUwmcWAuPOuhE
         2v2h82/xOmvr3VeGacoq8IH2inGd5teZzsO4XI53rg1Wpb+TEu6cHPqv5pSN5HwJqzfJ
         3Zwm93JMEbfubR4rczc9VMEQhrwOg+J2GrIIvKbVzBejOPFOf30q1tWYG/ixdU8hH+SI
         6Orw==
X-Forwarded-Encrypted: i=1; AL+hErGaqV1SwkWAkBK/CShBccIKtkbUjLaOuDV+ZI/1IvAgAtOrIu4Yh3i0yHx+ES85QHuTDmdFkDHxStuwZTfNQMNr@lists.infradead.org
X-Gm-Message-State: APuU4Z+sMs0VsQmXTGgy75rf7/fZayleyC5qyD3QW8fHpAMlcpCxKZPr
	Mcr1KgKQNQyBia6le+ZhNWWqkyoE6FZmAq12UMlYluHoPUxixhtC86gG2PSwrWgy05g=
X-Gm-Gg: AZFdTZceeQisXLIxqvhUGeK4qE+H4SwN3I4RMSzljjO+nANctyGErv6ZR8ndOg3hqfe
	KwYXT70ivknpBQlUjmnIbGtacAESJ+Fd8Ag/sbtS2Zg8Jw/BqQdHNflVst8lbmucRqBF2JTUC4r
	33MpXXDdNd+IEzlMbzeR4wpSO55tuKIymei3M3Q0MWZM340ANFyitIRrr04x1e67A9zAXxl6LGy
	wLugG/WpP2j6gNNXLaBfmmkXcRJ2YAMoCtzojk3FMdQuZyQu3Qhr9l0hz4xyQQWEkq1wB0O9AMN
	aWYmbPwCaW+I1ZWobM/njodao1qHRVafh4oeAqVyARvC1GJLXIzyygEfJotrE17sVHFn1Al3eQe
	fEbwnaqupYM5s1nXrtuUzDjQwlfnAtDe1oeZ1YHK/97jTmwYfAhr1PkiqX0cxiNueFqLNy8eHR/
	kI9DNvJfdGZtKoL1G1rfxa7GfDQ01CySURsUrOylNLjD0qgeOnRqWAhPv1nPAv6Fqp7oglyiuKl
	Qc/o1jLl2DCzKBbzVUDom43YuuYF9qHOIR5ChbacGGDquC4XEYNju0zgYUt/R+H9zjZeDHApaz0
	1YgIkn4GGl6TxgJTiJCRhlxCl3VZiUJspHqzdx41rYuELnyjYcw=
X-Received: by 2002:a05:600d:6510:10b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4bb8881de57mr163432115e9.26.1795447296665;
        Mon, 23 Nov 2026 07:21:36 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm313174005e9.4.2026.11.23.07.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:36 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:28 +0100
Subject: [PATCH v3 06/10] pinctrl: scmi: convert the drive strength with
 MICRO / MILLI
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-6-d61f039be008@baylibre.com>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_072138_718819_053830A9 
X-CRM114-Status: GOOD (  11.76  )
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

MILLI has the right value but not the meaning of microamperes per
milliampere, and <linux/units.h> has no current conversion constant.
Use MICRO / MILLI instead.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 80c6e83a3a2a..dc3282126d54 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -181,9 +181,9 @@ static int pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param, u32 *va
 		return -EINVAL;
 
 	if (param == PIN_CONFIG_DRIVE_STRENGTH) {
-		if (*value % MILLI)
+		if (*value % (MICRO / MILLI))
 			return -EINVAL;
-		*value /= MILLI;
+		*value /= (MICRO / MILLI);
 	}
 
 	return 0;
@@ -228,7 +228,7 @@ static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
 		*arg = 1;
 
 	if (param == PIN_CONFIG_DRIVE_STRENGTH) {
-		if (check_mul_overflow(*arg, MILLI, arg))
+		if (check_mul_overflow(*arg, MICRO / MILLI, arg))
 			return -EINVAL;
 	}
 

-- 
2.56.1


