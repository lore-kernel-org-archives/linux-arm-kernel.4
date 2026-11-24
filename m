Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911D0606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 20:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=glWItbRP;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=R90t7onI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KFzLi3vzdDSPGhuH40A8wZRyinBPu8g/pRL5DsdlYi8=; b=glWItbRPd7X+Wg
	1Ua7eN6c1ebTqZHeAimSXPlTuvuzxjnT4Ak3LVplsmKI7949psxACgFjzSHV/mrRPHd5t4XeWjhLH
	dB9udNtkyjoyZpIuOVULBZ0wQ3U3YLMXlaJ8OHPrv/X0c2degc/7wlUp5TbWkKExKZJ9pLfuiuVb4
	uGc8wgxuTaMa8OqDLUJyHVk2DZ79k/oGzlV/HGOl8gXE6fzphcvwrc80uxK700oRd++01ZSU2uhnm
	CTTSzO1MASHdQnjphtSicO9dt8S8pHVSiH9d4iow+k7zSdE+noZZ8hr/mpeF/3c6djv28HWh8aGt9
	3qxnUN4Ig7qaMVaIfsDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxOR-00000007kkx-33RZ;
	Tue, 24 Nov 2026 20:45:35 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxOP-00000007kj4-2IKp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:45:34 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-8b315dd057bso31755587b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 12:45:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795553132; cv=none;
        d=google.com; s=arc-20260327;
        b=YgSM8CxpFpz90Deon2PkB3Eyjin+eiw+En2Wz/9Nitja/nkOYWss/uI0Kf/DimOium
         48vb4grODjWB6iR5y1Lpv8nZ2z3fXbQMPUTj8bid9vHi+EMoB3IX10Aul84nX/rv9DaZ
         iGtPPcWgkBlPUZAFNDBBUtBIghhzKjTsg7YudSyN5/L+f7SPn3vvD2ramyyaqtIX+oYd
         boAObxJ45pkTP+d/HYq8bHk7tjvQ3IWYaabfiMwKyN8fdZIi1o1eWPIoQ9+kX+6XaV+D
         Ic1kAOtYqexA3tKLomc2qHm2RWnNwbrjulYzJZq2i4LNGLZ9j9act2+pnA8NvxbVVO8Y
         Jurw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KFzLi3vzdDSPGhuH40A8wZRyinBPu8g/pRL5DsdlYi8=;
        fh=VLn1mh4rKBvz8QYWXiykTDbnqGEgjPCCkAiDSIORRfQ=;
        b=WLeTuEwj/yWW2OyVaLblMq36A6D9Hkced43KFNUEqyUZuCeV7QzNB87jsrfPtMacmW
         s/tPOowOJx35v9Z8a1qXw22QrHFdcx/dhGEDvzOnRXDUbQbBiKlPXpQDQQVN5WDl9y+V
         EtGmYQOzV2rErLExnlDx9k3dkHVWQTfQUYc9u1MRnMjD8AEXud4PcPTnDG72cZsikZb+
         OXwg4pKhD6qArjkVv+GvvqRD3BAbk7ZdRI56+GQpblO9J8p/T77c2d5oS85IjO7EtvPP
         GqbovTBjaAYPxmWdZ2z83cA+WJs0lHqY3m/70KK8LX1tPJC7tMOiIYAgitIYgF0uWuXl
         5lkw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795553132; x=1796157932; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KFzLi3vzdDSPGhuH40A8wZRyinBPu8g/pRL5DsdlYi8=;
        b=R90t7onIqWceTO7ycfHwDRpJODze4oLHqHC+nwDR5adEV7+dsLUebxRWRkUVu1Iksx
         zk/xva1PZLoc3nYIymmFYC2L5cSOUnVFeotjeiycz/j/0gjXPUWXgkMQdpb/4o63lhDL
         AdSuquUPKU8HR90/ofdDULHjgPcuYVfcfzQb+NEh2wjh9KhPPGMXaLOY0fShBAkPcSM7
         WjBCTJ/ZxpCsTO4JyF22c3KmRlj/mlnuKK/o7tx6u/qmshkV2hkuy4LqBV8GpCyKUQSJ
         MEE2W19m6EqqY3EFx3tqf2wxaGHZvam+vGLAYz7ZEWxsExh3Es5FO40vs7BphzsN6IcE
         Z4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553132; x=1796157932;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KFzLi3vzdDSPGhuH40A8wZRyinBPu8g/pRL5DsdlYi8=;
        b=EUuVEr6WIt8qTe/MBRJ3kT/+Cr3LSsxe++lRUbrOVxIOj3wO7YmaJlLYvEd1jCsYSv
         bwnfTd+1u+fH/0tGR3r8IAlGDQ9cyrEoFgDXQmAcxRuIJ6xXoIGj8/tJeXP4h6WTWnrp
         MXpC4dzuCVfxulr2EswgNc4wRSDhFLgZ8LW84708oHQ1dZdHW+0SNki+ViMZvB7YH8wC
         7eiWlXQgZtHzG1Ksyil08qCQC+vaC2WeY6wWgBRb2Ee4ZMpsJZ42rFfFzJVJFcRBTY2X
         OvZLC0DIE5Bm4v4UnL+WaeL+r9EcKb/3dtvw/bAQ68KQEarGJ3vXNt2KFXOdOIAABFhn
         60WA==
X-Forwarded-Encrypted: i=1; AL+hErH7mQDm8Kbi8UiMVEVL6+kbx7kuAGm2tSdtDnYsfEhMwSr05pFCVcCtFcyTGEOFSepznL4T9yzjel4oDTqzU7wQ@lists.infradead.org
X-Gm-Message-State: APuU4Z++LiMNGoGIF0Xq2a5Izak0PN64+yMDhwy8p14iMeSjdMaM5pgP
	AgDko/1wmqEmgJpV+QYamIwMpokEBkv4vjZjgfWeEu3gx8cGBj1ryell9igoklZF7wtbnXMEnD3
	t8EeGXjOHtM552ZV/iOOM+clGDsnuXvo=
X-Gm-Gg: AZFdTZev76et2imazGk7AHTdgssghjm6rYsvQTkwvpR9cqRhtbQwRatEHNrYRSQiT+J
	ODYtGbSHk8+tW8XAFhxYFYO9F/WqCHQD2YkAfJUJ8QgtqOlQQKl+wg1tiEz/tLOg4E+0NzGLiDg
	JLk9W53g8D6aEMl+19vyTDXZ/vTXr/3ATQAog1qLzax0euZOy9EPG/+1x2hskDxrfju92osKRCB
	RPGSPqpvNJIi6UQ7OYrh28uCOiQlrrqnRArJFk7oFaeYAdYyKhN/xOVAt79Er6ETrPjPFqcc5Cx
	iyWbN2Wojb2aj7VqI5gvo+VJcmhLtJVhv38374qB9E7JyA+kZTYfzfe4c0C0vRcZzGXRlzhNozL
	nvzpOVpbGgUn8nLfQa4grQC6UXd8qQ0V/oaWPLJYlOLgbSoTZXc/vUqNYsIRdjSH6OuXrKtAILb
	07SEuIWQ/2x3ooLbHE
X-Received: by 2002:a05:690c:799:b0:8b4:d584:6165 with SMTP id
 00721157ae682-8b52043ff55mr69264227b3.21.1795553131511; Tue, 24 Nov 2026
 12:45:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-2-tanure@linux.com>
In-Reply-To: <20261121213102.143130-2-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 21:45:20 +0100
X-Gm-Features: Aa3M54pybnp1CQPsafQYDf0P2DptibC917JzUwMw-x18aat2wfvVMhiMsv1rR3s
Message-ID: <CAFBinCDPGYpR6rmtJvN5pT1OdSN-ne=YJVeT0kk4Ff2SB2vraA@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] dt-bindings: net: amlogic,g12a-mdio-mux: add the
 T7 compatible
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_124533_600999_3CF11268 
X-CRM114-Status: GOOD (  13.12  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 21, 2026 at 10:31=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
>
> The T7 has the same management bus multiplexer as the G12A, in front
> of the same on-chip 100M PHY, and the G12A driver runs it unchanged.
> But a device tree that names only the G12A string leaves no way to
> tell the two apart later: if a difference between the two blocks
> turns up, every T7 board would have to change its compatible to get
> the fix.
>
> Give the T7 a compatible of its own with the G12A one as fallback, so
> the existing driver keeps binding and a T7-specific match can be added
> without touching the boards.
>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

