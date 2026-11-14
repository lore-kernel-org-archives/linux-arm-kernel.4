Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743A0606A89B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CUkLpAea;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NFezuJeq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QQLPGC+GOI2NLww48mMh5/LqiV5CVnIpMnhORWOOWe8=; b=CUkLpAeaLigYMJ
	FWFmfykaKuet0EBUrH96HhxSDu8gpOZkvsbhE4ZgVda7O8wA9F9AMXHhr20QlSgWPcd1RlBz7Jws7
	BcUqY9A5G45mpNvV72h0yVe2FIl37FLtrhjkpCtiBrI5Vd6OJsCseIC7y0J4DPFYh1yUFH1fCIPhb
	S6D4kECLMZILFJsUK/x4ieqbMz7yhapxoqGyrG/FjBez5afUTSY+Hi9s5pv6M2CWK8N1lu061sTxp
	7jKdMvNUQIRfTGhrvdvBMVXqyETGo1NVh+NwDDhlZKicgqnqKxh8vN7W60y/uQlpVLY2FlSGNVPrp
	t6qi2VVedn5MB+OLMRKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Dm-0000000FDZE-3yq3;
	Sat, 14 Nov 2026 03:14:30 +0000
Received: from mail-pj1-x1062.google.com ([2607:f8b0:4864:20::1062])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Dj-0000000FDY8-2F7o
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:14:28 +0000
Received: by mail-pj1-x1062.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso2164025a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:14:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626067; x=1795230867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QQLPGC+GOI2NLww48mMh5/LqiV5CVnIpMnhORWOOWe8=;
        b=C8y9vB6tRL4nPHMHG6blji4ISPsS6/U/u7WGXUHmgA54DK3AAWvjtktsJnmHt7DZX3
         1Y0Oumxt8VzAUfMiB0ATMf7+GcV2iLeKD0GejJOi6N1y7DNl4rw0MvC+C49N8KIiMDbO
         F4sXx5GTtIN0r33yg6zB6TDX18KYk0zA34eTZfrKbyp5IVoosyHhbXNokW9sOnJkDr1O
         65SZE2U+dcpOzBBgpF2nLsDMAu2MwJQiFVlnREc8cfulgxGq51lunf4dJrvL4dByusvL
         HuJldmRqfFbxsjaIxOmzfyQWu+RN/ESsGhAPcIvKPvFmZl8ZC9LtrURZaT/Y7BTjkvMj
         8kPQ==
X-Forwarded-Encrypted: i=1; AL+hErH98lhhAGz8ghfpWb0t5uKIeCgnlE5o52NkFwv6lhnwAyqWD9BLztzQut/T0DhqbMuyBmKme374YqI56WrUoFo7@lists.infradead.org
X-Gm-Message-State: APuU4Z/WTBm/nEcAG1UVUu0bp+lfxHSXbaqi/fBo0+6iHkKibAdUaBQk
	cEoo2181mvwD7BwpcYpNcIdz0aGNSCCye0rc4rWC792rKes3Fj9RyZ6NNhULeKGpJd4m3OBEYGR
	ZO2xj7X1KTaAG57BRQ+7rF4xCRd6mDGMNoO+owzURP+1QCGv4rp2eoHAgN/D59q52CQUTO73FJ3
	Bau0tfrSMMQEX1JKPceOC8lOrofT7lrkCLPKw6Wp+At3tHKib9N2TxCC2NbaBb5u52w4Yn9UlaE
	OvsF0+0vutgDKRdY+PmyKdSDPloD/jTpDQ=
X-Gm-Gg: AYBFou3JlI9XQjIIhTS2043T2I25Pl6wvcR6EGwQTxBiCsRfzdTug7KJ8H4hZxIqiPR
	aMqiCLkAauenA83S6bosI2nCyYpw2JqfsZ8yDfrd4fQ1IgvFVhs6ug1hI7edo2fcsx0y227kafN
	VDSZ17bJNewHYeN7iSj0M/S4NkcFJk42lFLNFpxkjm+/0lamQE9HoBNVfGnZLtjpa/vDLNzjSXt
	EyOi3v1tlxROuIlp7qaTRlEODMuxEc7d4vCZzB3mpFMY3ummRm/KhEwwHOJn2aFWIlv7WSFj+rs
	r57Tc3+5TftOy20+Ptl66G/0cWLiCJpsrkyGNnBJ2i4O8BBrVtGHw5N1jyByou3vYjiY9vSdmds
	RsEExcZFYucWgJoircSgCIiotG9LH1U3HFBJyW12LwzcyaC+MUtMApXXkK2Y0IDZs1Z7x2QxIYY
	3xV7kcvbW0GdiqeTEjr0z1fZUlAGPhfY6VTgObuSaL
X-Received: by 2002:a17:90b:2245:b0:3ab:24b2:9016 with SMTP id 98e67ed59e1d1-3b1b0b8c09dmr4239810a91.25.1794626066735;
        Fri, 13 Nov 2026 19:14:26 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b25dd0d5sm2727757a91.0.2026.11.13.19.14.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:14:26 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-947a607ec40so162065485a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626065; x=1795230865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QQLPGC+GOI2NLww48mMh5/LqiV5CVnIpMnhORWOOWe8=;
        b=NFezuJeqUFW0R4TskxUcMounAc1ZL22aT8tEmsq44LLC70cOuUg5Yn6Un4Dv8Gm5VM
         Tt3P21k6LuO+y0wT408ZRxK++LAIgS7t5Z4cSh7zHbH8P3cDG/+x0GkKhqb2n+Kf4FhM
         96tTD2OH0g3mUOgDaJPUd+RJaOQpxM6+BZRus=
X-Forwarded-Encrypted: i=1; AL+hErHFoYCd7ucjxN220Kt/HUR/azTQRhP4hgk2SsYQUtS8SF3Zqkb3AWBGD6dM3KtTiX5G8gOHipq23T4L4jBBD1d9@lists.infradead.org
X-Received: by 2002:a05:620a:4106:b0:93f:34c9:9252 with SMTP id af79cd13be357-9494bc3df7amr779588285a.55.1794626065114;
        Fri, 13 Nov 2026 19:14:25 -0800 (PST)
X-Received: by 2002:a05:620a:4106:b0:93f:34c9:9252 with SMTP id af79cd13be357-9494bc3df7amr779586485a.55.1794626064675;
        Fri, 13 Nov 2026 19:14:24 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d94190sm33936366d6.31.2026.11.13.19.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:14:24 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Sander Speetjens <sander.speetjens@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] firmware: raspberrypi: Fix indentation of return statement
Date: Fri, 13 Nov 2026 19:14:22 -0800
Message-ID: <20261114031422.870934-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-2-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com> <20261107-fix-raspberrypi-firmware-v2-2-5bfe605a5cc5@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_191427_579615_43BE8477 
X-CRM114-Status: UNSURE (   8.58  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Florian Fainelli <f.fainelli@gmail.com>

On Sat, 07 Nov 2026 19:21:32 +0100, Sander Speetjens <sander.speetjens@gmail.com> wrote:
> The return was over-indented; statements should start on a tab stop.
> 
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian

