Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86AF606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 01:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YXlG23DD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tEBiBd3g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TgYSjiHbgPWcHQHlJLqHlZaybdYLXqmdLmzljtB2Wys=; b=YXlG23DDG+qdua
	GXsPhJ1RiQD4w534NMdg1WQyH3/YDJSKUN8dW2wJlnUSrlYH7qWObQNEQt+JtW5pq/7a+SmId4+8q
	GropRTovbTA2PgBjw3AoTWUxkzhY2EJTMjWbLu0YiBhYhB5U0unyGGFZKDs+e3+GsJLU/rAVIWiAI
	GAKYuZ3JRUwSgriaI7soUifnX4S6nrw9w/Q6Mme1aAhA5BwrlcDPvF9MkietikNRHtH1CsNPxr1J3
	BJ6TXTBdXpg9lLYos1UMa1C8w9VgXL55uAt7nm9IMKE6aUTA8Bc9KzZEzr1XAgy7+6sSca5/j/Gtz
	TEZuSjryNUSm8Akv4qqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSOva-0000000GxcE-27In;
	Sun, 15 Nov 2026 01:21:06 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSOvY-0000000Gxbn-1Kxx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 01:21:05 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso172635e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 17:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794705662; x=1795310462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgYSjiHbgPWcHQHlJLqHlZaybdYLXqmdLmzljtB2Wys=;
        b=tEBiBd3g3DobRKA7zJI2Xfvul6lBjkIQtDcb06Jw5jrSJLfajCHgzSvYcl/A6vCwSm
         VNPOW8Zz3tottjFRhPocd5UG2oxYrXu7EPMDVTyzAMSbgIoDDfjxKynO48FUMjrWFRQG
         hhxUR0haqGPhmVVkT5sM+Vyhqg8BxKOCiaJ824qI3xhRnByeNouuKlPRMP/zPxRLoZWq
         chg3mUYqAYpOj1OImJXe5URQ2edAnz+xhtf6YnPb7087eFRqMkm844BSo5UmUtqbRIrX
         eN2GZBQ/v0qCQEPwkRH9kBRGbhmb6saMQz5cDhmHT0NsiBr9dVcSOtM8TrBeQfAmWnzo
         Jkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794705662; x=1795310462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TgYSjiHbgPWcHQHlJLqHlZaybdYLXqmdLmzljtB2Wys=;
        b=Ijpv53P7Aubhvjej4hmO6RSGiCU0Dz/n2qBDHoG02jmCAYx0SHQroNrEyMJK2IxdUI
         3FPnULfK6bKT1eV/2fqonWHtK0NpnsnAkrbfIJOIce/QdfUdgulvsqlg43cQypcAr0AG
         VVBjZHGBUcAO/Uct05a3u/t8hYOixacUFKe105FkWD2cisvwy8l3o/Nzf9jCH7tBxreR
         GH7Vza3czCgKAU5iJKqxTZ25m13llPO+EYg3YqQH9f+otKSPcbDc95M45kYGmyUsLsxu
         GPZ8I8hLRcv4zAuQuAuTicEztYQoCkD8BC9PFYaNIeN0pc2JWonfHAdvqk0TjKfL4ac2
         a2zA==
X-Forwarded-Encrypted: i=1; AL+hErGPP9GWSMKTVKRLfDU3n/QrNDKJdOwqQjCQdlxM4uNm2yo07X91RklC4XocJJsF5oTleLesLlu2tkAC964RHB7n@lists.infradead.org
X-Gm-Message-State: APuU4Z+7YFmx6+lT7dbQKK5/O+GP7rlCndFSTFJiYG38unCBsTv8V6iG
	DnB3DUmSN1dikh9GudHyRUgkLzmNxunf6jYiGnDgcaAgBds71JnddlHZ
X-Gm-Gg: AYBFou2f8Luh2TALqGQbbrUaGdam7TjNqYcdmW86P60hwTjxoQcF+dv4EztgVcvCmU8
	2mlvDHRb2E8eWZD7rPNiKQQ0dkTRwPL4jIrDcpRqnl+7Hm3Fo9glHFsJ2KTa5HflMtPTxXTS0sw
	DaUZLPVDyeDM/dS068uYYdwjLyS6v/iBJvlwiHAC1efj+DYHhTCOon7opvvopP82iopRzW/3ct9
	eX83rrOW1RNeitolD5z/++y/haP/Q4xFT61dDoFI93BDrIRKpbUQZVilAGrxMOWfEcChWpob3tb
	i9k9PVyQrbepThDe87T3wtHz6zmolM4a8XqaqiKyPG1PoYzBE5igthYVPie+e1lWooD9fpp4DXt
	14I8Fy4FRzBiZZ05my2hkwoT0M096b3KdHfRKo8N+s3BxsNF3+NEEJRrsXD9BQeARlgwf0F6LZN
	YwX/qxTRHkq+DaYv8Z75xdCz4CcXbpobdI0VxmA+eWz7n9TkC4/fMQ0YSOvRxfJFIu4O1uFZXGj
	E8nudN9foWxSIAo8NHMZaw3EjaSrhby5/wVMqsXUdOaSor2XOtz0T+ya60IrAfba08l5OZ24OWq
	4pElsmo12PIBQVxSFTf7JtcjlU6W2JMuR0SA2JK/tgFlGjFEiN2EHqrBzol9QGinlukdhJRreRE
	W69FT2XXvXrK9THwPzJ2ITJkrtaI9nNSNbhcEM8VAfzIQW7H9bA5tM7a5FNv+fW9dZGU3MDIqMZ
	97fV6XvlgklTK4
X-Received: by 2002:a05:6000:2889:b0:491:da8f:7276 with SMTP id ffacd0b85a97d-49c7072cb5cmr16023280f8f.26.1794705661826;
        Sat, 14 Nov 2026 17:21:01 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net (lfbn-ncy-1-251-132.w83-194.abo.wanadoo.fr. [83.194.94.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6020bb0fsm12967006f8f.34.2026.11.14.17.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 17:21:00 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>,
	Frank Oltmanns <frank@oltmanns.dev>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: nkm: avoid 32-bit overflow in rate calculations
Date: Sun, 15 Nov 2026 02:20:59 +0100
Message-ID: <20261115012059.1022197-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101203336.1360239-1-romain.tisserand@gmail.com>
References: <20261101203336.1360239-1-romain.tisserand@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_172104_364822_432A0738 
X-CRM114-Status: UNSURE (   7.39  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Gentle ping on this fix, sent two weeks ago. It still applies as is on
sunxi/clk-for-7.5 and on 7.4-rc3.

On 32-bit sunxi the N-K-M rate math wraps above 4.29 GHz, so the clock
framework reports half the real pll-mipi rate on the A33 (594 MHz
programmed, 287 MHz reported), which broke the PocketGo S30 panel. Any
comment, or could it go in for 7.5?

Thanks,
Romain

