Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8107A606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 20:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ulRmo4Gb;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=G2eX0lM5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zDNVDfs2PwxqSj0Kee0hW9NffVRwrghNSp33hY60Ag0=; b=ulRmo4GbKGTrYW
	UqkwejjF8bdbO8VT4ZnFJsN0HQhdy8PRT6BPUPgDj0hdDP/qOODq9mbpituP7dnZS8XLoc5hLHZr0
	nMM3rdkL2/Q2/lUNBjt6gQcb+6zKi64hG/+S8ATkZW5rgpPT7HW1VU8LQYEHotH0AZS7uBao1LhIe
	yYUoWHY+acpzZFNQSr3nIRKCxdXCgBRx+k/GMod713SmHQ6Z2S4S+6YSR8eFAiMgJrFAG/8eSejdf
	50yji+hWg16zVyESn6x+fXWcRmjYKsIbtijfLA3rzR+8uMWgfHWvLx37DnPJihnAgbi49HTbQS9sV
	+rk8r0H8m+/7wdFEMFaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxPk-00000007lEj-2sLS;
	Tue, 24 Nov 2026 20:46:56 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxPf-00000007lBN-0qh7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:46:55 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-8b0d126f631so43165337b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 12:46:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795553210; cv=none;
        d=google.com; s=arc-20260327;
        b=MJkrpvjIRW1K10dUFGdt8M+Gste5drSSAGIOGE09SHoq7G8UjDbb2HqELo72eROLuE
         YQiHudBrZezoi3XaqWZvz2B171bX6lMEM/ZZc7CjmjXfiK91/lf6tQbHufFPE5Ihoh9l
         BxNYcAx+Sw8M1DhJC44esvFrwBUqbR6xhlIUJi0E4J2bPQRZStXCXEmOsvdLwdOXDesF
         H0j2afbUUahOo5fSwrd47UzhHQcT2O9As3HjoyEb6C3f7nsBZWXLfchB7VLC5ycnLsV8
         xhKvIMGXUl5mHRt0t7AnuGM1nhUW/sdGDmwOPl8tFR6+u/GFhnJB9dsVesNDqfOrchG7
         I2+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zDNVDfs2PwxqSj0Kee0hW9NffVRwrghNSp33hY60Ag0=;
        fh=hX2hEdUmrp4sUysANfp1jZeCHFmS6ukqpR6ZNq0b/48=;
        b=AtK5T2FwoJZsjM128gAG41tr45ha0LkkxMGxaqcp4lmbHh7zgxRPIOCNYkgAoX4S5V
         uTh1oq7yVALu2FMbPDCRXOXXIlG+N4IMpuSgKmHcRAcsJHE3FSg3cg+TYH9tKOCJjS3v
         G1R3APHWE6FxYLPbPRj7/G646VUEUOq14NV1Q2aNF+7N6saQf8dbdgE0nY4At9tD1i3f
         SwzGuCbleDU+p5aFnT4zjXx6xqHeMiUOPSRvDFwddfUh1YTSikMmY/DDq7m4XMl16cMw
         Sd0sjsN3vnEquucsKyJKB3g4Gg7clrTqRdCch3WFWLHThU/yhicQWBzwMu9KI9Iz2W7I
         9OaQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795553210; x=1796158010; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zDNVDfs2PwxqSj0Kee0hW9NffVRwrghNSp33hY60Ag0=;
        b=G2eX0lM5fqYyM8C00g4zWLM4TRmOwlp7hpjL7A07hzGewjLqeD9xgG7pmUtNjgY4U3
         ilbK2VKWK+XYfb9pPBqQBqprL2HVMx/yGvPorX/u4MSE68dnIIm2zj6CAHILihd9CMKd
         0EBVsfRU4hYfZtGvH3QNl5kzsfguMkMGlHdqCjZ608zMRwt0HRoWO323FUexYIOvJmrv
         0TpueNSkC36XjbhqHj7brnxC821ssJUHbc8yP75jpOt7z73HmrrIVt0iq4MyFBbcJiCm
         YpiZWVYfePrz23nHOyOBVi2h0zwJ6Tl0muZvGrAlVKVPuq6CBUe8rjV/Bted7+k3NJFK
         yFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553210; x=1796158010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDNVDfs2PwxqSj0Kee0hW9NffVRwrghNSp33hY60Ag0=;
        b=bYJVNUOof83F+ZlQk+vS4rQ1HnEhD/9WkB6lnjS5rjrsbs9iIVfckjV75fwgsk37qc
         0djVD3pQKOqOMcMQQwy/jME+3GVSoD5k8rXgxfXpyxW+tU04KlWh4BzHDyMsZOt3uwHT
         C7AwzscgnfsSfswyJTohWc71Cm86Cx2bHLT0p4lIzJQxuhACq5OiiNaY1cmyp/2ZkdWq
         sDwQVr302CgrKNxn25uu7bnNjG686L2dlwxXhRfaIFTONSIDdUn7wVvMtFa68wz0Qeip
         ijmwI4ObOtlBO1WbXuVZP4JmJ0aWPQCDivPpz6kMZFuPf58fvWkqMwDnQmovC4q1PsG6
         uASQ==
X-Forwarded-Encrypted: i=1; AL+hErHd4oElvjQXGiDOdWAUaPEN/vcqym+jCNmt7sH2Qzn1X2+ltuwOY6uGz4o0+sFxATQdxoe4EZyESrGX8G6fc9/h@lists.infradead.org
X-Gm-Message-State: APuU4Z/WVsltM9VKgExu6tzv8D8WoUqdiMAX9iC5WLHrqz65++3dJgZx
	ax1urNN1ac+9YJ6Bd5KIthSbqp1KHOubheiZRlBXefLev98lMF4Fa2VS+3z5835W7xbkxqcOSDt
	6YwufVjFFMuRHHqk9TQx47fY9WlDMHik=
X-Gm-Gg: AZFdTZelpysqC7ZDPwlxAlNGFvXjJjf/C9EDtpV1SKQ4wtPIU7vgFX35HC9JmxUigs9
	JT6yi8UUPwqX1cCVLYJGt6Z44WBC74JhPLd9xdGcVih+dWwd0V9KbdjCXw0h14oEw7SBWe+xypK
	53UncNlVh+WmBI6jTxG5CYakmUlxzQkHJy9a/AYsYVbrvHYYmFjC7aXq42AXBl2nG+pYj2CknOQ
	QjJgq3aM6r//q1ZfVGroUpFJE8/NCPTQeptm9ibFJPhoUZGkudlgRPIV7Z95WQaocGAeMeSbqO2
	FcP8cflTyomV6LSSMdKZwHMspurAewBi8lEA8XGehLfrPoGxrQKlBFc0MAshkZT+FLNa9xmIFzh
	68ILqJZxoUmw2tbFWcMZYFh/bFzZNsyAhk1Hd7qc5HNUpEj5pyjZ7EfyDVjsfD4DNbB6tew==
X-Received: by 2002:a05:690c:4a02:b0:8b4:c1ef:7a62 with SMTP id
 00721157ae682-8b5204e0b7cmr63699017b3.49.1795553209755; Tue, 24 Nov 2026
 12:46:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-4-tanure@linux.com>
In-Reply-To: <20261121213102.143130-4-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 21:46:39 +0100
X-Gm-Features: Aa3M54p-q6D_8aoLALfJ3nd02LBvNVydTGTGPe-SwdQ6NHwkSXTzPSzZ9Fj7tMI
Message-ID: <CAFBinCAB+CdP7ypZ3kZKKqFTqoAA5bdA9nUKkWX3fVit5LBNGw@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] arm64: dts: amlogic: t7: add the ethernet controller
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
X-CRM114-CacheID: sfid-20261124_124651_250426_F9148372 
X-CRM114-Status: GOOD (  14.78  )
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
> The SoC has a Synopsys gigabit MAC, glue registers for the interface
> type and clock timing, and a multiplexer that points the management bus
> at the on-chip 100M PHY or the external pins. None of it was described.
>
> The controller reaches memory through a pipeline stage with a gate
> nothing else claims, so it is switched off as unused. The
> glue registers share a clock with the multiplexer, which probes after
> the controller has programmed them: unless the controller holds that
> clock, the writes are lost and the port keeps the
> bootloader's delays.
>
> The multiplexer and the on-chip PHY bus start disabled: a board enables
> the multiplexer with the controller, and the on-chip bus only when it
> uses that PHY.
>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Also I checked sashiko's comments: those seem to show up because it
didn't see the patches in net-next (not sure if/how it should know)

