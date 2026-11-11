Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5363C606A336
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=119PTyoc;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IioeSSvF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cBBBVEGbUigmAVKraBU8HoXde7I7HCP/fQU5YOmGir8=; b=119PTyocoWc3bV
	Xt+5lf0TLO1D+gHfrPAFno4XnT1m1zErH4JhhaoLYI3/t5QlJ7EWZOhkW+hHMdiEL0tQqGfsSrXrI
	PjSTr++uWi2/yS7e+TIM12Rb9NHTrDkcmd3joa67m5a0+qBd4Mfkqdxm7CeWgEK3WrRExvVy55ipz
	EpVsb1xlKGd1F60bXm6G+iqqR5TD3imAlxdrQIDHaLQh56Jr6HEPaTQSTcYSQFGthGhfQq7StzBja
	Nt3nQj2NPC2q/TQtY45DwjAFC7lpZE/kgpYWq/pkr2KuL7WC8bBWJORoVxpUp50mQYdfzwaPPwrek
	7cMx71IiyroOCH2KYXtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7JZ-00000006ecu-3LnA;
	Wed, 11 Nov 2026 12:20:33 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7JU-00000006ebe-2qdr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 12:20:31 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-8b2d14968c9so34155397b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 04:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794399627; x=1795004427; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cBBBVEGbUigmAVKraBU8HoXde7I7HCP/fQU5YOmGir8=;
        b=IioeSSvFmNXa/Gn4REZfTtF1/uYrLtYpNy74CYowr7V4J8oeVGnfrU6HAyMkQ29Z5U
         RC/lI1pDkWXB2AN/2n+uqXypdlIAI7tvSU4AX+5SKDHbZ8+l+SWpc8L4G6ErB5UnH+ou
         clL8XRx1d9lgvp2gPSvMmhh8caj+ImMsfXqAiTl5Xgs7pWEAYmy2oIHiDtZGz15FM2Ws
         VHh9LM4rWcdeHJsTlIj8H9e77Mk4dwrNCT2FH2T2UD3i8ZxebXuIIvebwsFI9peHdpQ8
         jzcx+A50/aBLjrUrMhA7h1m8EZxAARckwCyGitjyX6KLqoq6om3eiR0qbwuxVWjPKEoZ
         41vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399627; x=1795004427;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBBBVEGbUigmAVKraBU8HoXde7I7HCP/fQU5YOmGir8=;
        b=y4Toia+uFGNVXzzT3YGvUD9j1DgyIN8SH+9vKpcNTR5SXtEt3zj2TlTtNlYCo3JsiW
         g7iZdSqlwVOrNaWnMs0O3SyPuuH/8prrdZy2tRNQOUOzFnoibh4Eid8eNm5JgQMs4SNT
         Ms1i7ZlBdfrLeLYaLa4seVtZO2pRlImQG7hsox+R+ZpKBNhrQ3QrJeLIlsVyRLhdzXsK
         QL5CA5OFKRNQHWSOu0b7lBlz+ZXwJOtPYSzb7mjs2fsWEQ0xo8yDZUgzf3/YTnRX5p8r
         QTlX0ohS0Q8MOvs4eu0mKxxv4M+4Ac01a/5jXEbnsm4TDDxsiv71NY36rzY+RfxynWAv
         KO3w==
X-Forwarded-Encrypted: i=1; AL+hErEIWkWTHr9Buma4zbkiND3PHkUM5DCzqicyDPtbdeQCvvsb90r9bBWwpWWXkbCh+zsMiuinnhQFxd5ngPSAESua@lists.infradead.org
X-Gm-Message-State: APuU4Z+AuGDYnbVhgYf4scomID+jua6IwE63svVTPTPYzejEtyQeEnkf
	TyaRduAQWf4TLLSSRBiQ1ckJw+lHWjc7rW7hGyMzh2R1zJ6RDgAG3w2z
X-Gm-Gg: AYBFou3e1FCcWQbiwaEiefDi1wUf9aznZ1fERGILvyCz4+/kdqxJ0acuqMLO6/65wjs
	eWGQiLKtaSfgS3SbeWAV7ir9L0Q9PwcMjxzDGKJGVrxCxOsoB5X4k7jCUeNm9oM4ZiaPy9sYpHo
	ZE0xTOBuEQpqZStfb2Tlgimbdg42nfWphauZh0/wbvJPg4au9eCye3/zbV2wpqtHskC6DOasHht
	BgMtXz/M8ZVKwWQcV3d4anAZZy7wtqkcNKPHA3vcZtQk7MmCYwTW/9nnHJPMOK8WHjkM5h0JXPt
	cpzEFEWEwhO6WGXMiu9qzRSL9w8pTatYDJi08c8Eztp2RJQUGLkh36/k9b8XfLd14RZu79+HDkp
	wi8fledih7DR5pOXeZSgE8B3Nv9fYdoGoIL7bouaPKm4EAO+V5ovfcO7NHN7fkFdwHVuKMALTB8
	qDmdTm60hkVuyZeHKz6NZt4XvhoP3dGaMiuql5LyspaMqcWLP2tybREtZNQ4MD9OIbyFIRHqnuD
	dJtnWvEgl1kV0G9d371xsTBf9qLJ2AYFmNrZ3xpqtYQ02jRnD7pl2vmkLm+Ypz9lxQ2Wp1wj3p4
	n4jYEmB332g98J+CdsMSG7ppafj0/GziuoR5yP+mF2F7d2NrkqzWMaGo0WrVktDB9Qz+c/IwPvF
	gaFJ2SwO/9HoNXE/JXwiBVJisKzKFdYJxyGd+Y0IGyIbuaqwVI33Df3PK3B8YiFT2RJOXJA7Ulg
	dlh2+LfpFJWR1UyapIaUAd
X-Received: by 2002:a05:690c:a849:20b0:8b3:344a:4f44 with SMTP id 00721157ae682-8b3a817a55cmr9874957b3.62.1794399627423;
        Wed, 11 Nov 2026 04:20:27 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933a165csm42716417b3.14.2026.11.11.04.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:20:26 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: linusw@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Andre Przywara <andre.przywara@arm.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: sunxi: use automatic voltage detection on A733
Date: Wed, 11 Nov 2026 09:20:12 -0300
Message-ID: <20261111122013.35133-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109-a733-pinctrl-v3@gmail.com>
References: <20261109-a733-pinctrl-v3@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_042030_602032_369B3517 
X-CRM114-Status: UNSURE (   6.90  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/9/26 21:11, Enzo Adriano wrote:
> Add BIAS_VOLTAGE_PIO_POW_AUTO to select auto (01) in every field of
> POW_MOD_SEL at controller init and skip per-pin voltage setup.

Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Radxa Cubie A7Z

Tested with the posted prerequisites and my local board DT. POW_MOD_SEL
reads back 0x05555555 on the main PIO and 0x00055555 on R-PIO, and
UART0, MMC0 at 3.3 V, R-I2C0/PMIC and GPIO interrupts on eight main PIO
banks worked.

