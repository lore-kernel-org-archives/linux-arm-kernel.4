Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D239606A893
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 07:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FReETVLm;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HL9Gmjkk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uQFAlRBHBpTrKEbc1EEKL9YBp7MmZvjWg94AE+sNfOM=; b=FReETVLmfSFY/kKZjhDeyFIT//
	rSF/kfoHcQ9FG6ChjiTPemCvGwrOtwAy5wYYSnq/oilbmuHLObUqJ6+Ak/qR5fg2Mn7CvHdqiX6M6
	T1uHmzftGXFO8saLP0ReGfK5XAjV5Swe6Z6kza8IgfBgN4GIrsAGYJ+cEvPY6SkySDyoZdYB5MB9p
	8FzSjZ5Q4h01lLKyCk0unY/zMyxQcw0/wdDwmz99vbw+fGUKCWbZa/SJhVtpTRjdW9ErvNTP09yej
	05e4tAEx0nC+KUTnOJaaDSASbShPsiWr2oy1xMl//qY3Ux5CqtSTH7pSUSty+4Nds4ZB+FNHpbMys
	R372gSpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlyF-0000000Bw6K-0aC9;
	Fri, 13 Nov 2026 07:45:15 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlyC-0000000Bw5P-0Bcq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 07:45:13 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5c0ea47f5b8so96261e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 23:45:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794555909; cv=none;
        d=google.com; s=arc-20260327;
        b=Oxk9rI24RhX74GwpNlNvlGe2VppgDYKZGRz2IdVcgHk/skxNLGPI27Sfx/qtNeK9px
         7vLLwHBdA1pJvjrpwM6tVKdBoNifRGVK+Vgk4IJ5Gfo3wD/3lTVW5rxQn7lPB+lJQ/r4
         EC9zyXtvJNeVvLBLhLHAMrT5I8U/LIRB84pJx92D0ISm1LPwN6CYguZzt5ymDBlQr5J4
         P+Y+kiNDSAoopxtjD3o8wblcin7XDV8Jwt7BehICgBvzbFT009Kx9Bb5EpzjUh/KjpNE
         76j6376DzEjgJSOsfYr0m1/LaWMXGlCVmAOS5qz+a5Ov7RIAe4FDqhPnluIwjKyFnZsF
         22Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uQFAlRBHBpTrKEbc1EEKL9YBp7MmZvjWg94AE+sNfOM=;
        fh=5kZFMoj112pCp+42L9q8qG7HomLIGRuXgSc3gw5/ZII=;
        b=VcnthXUKcpfhPKb0X07aoLnUH46QwRNYOI6COZgburS03NGADASuHDx0tVgsVWb6TV
         U92WsfgOTKA3/JSA0Oel4z4Eqz3gC/DLuIYQS+HPzXCs3wZWESHZC9+aKEobB6+Kpe73
         WzOoZs7YZK60DTu7zzH0c0W3TaDQtRUXHg1Bxbn2jJ0AkiTMj7bwmI1tQOt7sfQnoE2M
         hDv9qEe9PCLE1m89Qj/+BIyIQaTt8C99n8BQvzYmaztuOeFMl3s1X2qw0no1La+Q7UBm
         9fkE/CL9O0SbHjN2Sd6u/myTa/zZFfKVMGzuhaAWs+f7mucwRtslei0VHbeVuC0WXnNK
         vDiA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794555909; x=1795160709; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQFAlRBHBpTrKEbc1EEKL9YBp7MmZvjWg94AE+sNfOM=;
        b=HL9GmjkkbCf+hftsZMf1rU264z9Fs+BbGX/0sJ7mqa4HkMeCPa3RzZO1xnHWg4IRft
         UyTEED2wQCJiCpIvsDGmgQl+hXrgedyP671r0AWsItsWMWq0OKWVOs4NU2nkbDfcWBMl
         DgtiG0LGd4YKPuaRjY3hLC5WZs0+QTzAa3LzDtkV1fB2NFp8lbYD5M2vTAguBTiMoEH3
         CB32EcBH6U9wtDxrr8qBiXhh0XUVS9pETuoaGqoNxZvZ2coceEoG49iDIOtXkVaD+yX+
         UpGZ9vibHCX3uFTE3pHpOdGVEhIxPIIE1oJSBH24t9nWtD/W7zF8u5zb/k3I4I7tDZ2E
         FWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555909; x=1795160709;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uQFAlRBHBpTrKEbc1EEKL9YBp7MmZvjWg94AE+sNfOM=;
        b=MKMwZIgBWsRkw5K6M5FbiHyESAoB1mRQ0ZAEFoX6ENkEYwgfoa1Ut0HHqXlXh3Rp2F
         B49b5AeiFu4uLOwvWJGwNoDvCO3TLn/EiBoc/rRiC4GTwzqSFloaN5qxIMr7xX2r9ucQ
         977d2S5Am8V64ZB/mS2oTton6NxxxPfT5oruLLdzSHzKshlX3Cjo+QsWBF2QsDUX8M9s
         Y3cOyr/GVRE968iLkNiBTkI3++tHQIj1KR5B2ZELcFQAhwBPgbZis7d7Tao20GtOQ5eJ
         lU3y2AyzAozoSIrcCVy6fLx4AyhGyIEmt3Rc8KJ5LgzpfyzjLGOJM2oszZcMyP/KP2Pl
         zhuQ==
X-Forwarded-Encrypted: i=1; AL+hErE6ERfd0xmnEuB/OQhUVrhB2VbhLUFUJZEYtvfxwy2QeCzzNs/3osBhZ5l6DOX2LVqHhy+Br8wKRT3I8fS7zm++@lists.infradead.org
X-Gm-Message-State: APuU4Z9jd5UsRTNX+gBKV5/srIiZiLSrWv7u11CuPgVmAiQ8FoFW/ce6
	GMeZmLDH9AIrezxAzFV+BqybHGKP34Ed0IN7fHk2yripelvyoGwQLpHayG78kNoyyqkK+NoIdqL
	0TduIewOuM8HcLSJj2kG8YCRPGUA6+bQ=
X-Gm-Gg: AYBFou1bMGhltv8w1TT1u/+VoUVuODQdK0Nuo5XLIveBn9t4Snxh+hGYOSJ/ko8tSbM
	RuPTuGtl55db03x+0JtVHEEJqW9OmrbbTe9cd2yeNyPtkR8SFKRwgbgOcroj8YjifSLAUDX6Pet
	EAnUOBusCogGQNU8zhO9vKf5Wlyr42r6NNuDBjgG+3CvsMGycIKkWt5XAU56+7fXX9xQWCyUJ3t
	wUC/4jZCJgio8bfZNDGb4B4Kn1WoUzsEnou2rvGIPqeSxTn2y8MsjtwtA6U9RcvnHPbWLIXWBTF
	rLId04/RslyM0iYUn8Jx3PwYHIoXwQo6vkYQ7gEkoHu+GZGDpDS4V7QLTF4YZiyVHL96iQ0jI+h
	0NbX6g9tu110/H6hlh4NvT2VpSN+NnCg/lal9gb60m/lPcFar/9RxdrbDBAnnMt3x0ErMRgdBOe
	xllGLAZK/V/reUmR5SyA==
X-Received: by 2002:a05:6512:3d0f:b0:5bf:e6a1:3115 with SMTP id
 2adb3069b0e04-5c170771fabmr758264e87.2.1794555908550; Thu, 12 Nov 2026
 23:45:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261112-opi5-typec-self-powered-v2-1-751906d65b70@gmail.com> <lAAxUnzGTXWSlQTm8PmFcg@sntech.de>
In-Reply-To: <lAAxUnzGTXWSlQTm8PmFcg@sntech.de>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 12 Nov 2026 23:44:56 -0800
X-Gm-Features: AclHuK-px0U6hKw50ELPgjTts3juNb6KJSAEdMlgQ9nDhQ9zdUWQkc1yUvT3LMY
Message-ID: <CAEy9hNXiBRaj-JtjOAy4de_BQV1jAKUjUCkYzSpksu605HTNZw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Mark the Orange Pi 5/5B Type-C
 port self-powered
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_234512_105578_F5CF54E7 
X-CRM114-Status: GOOD (  11.84  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> As you describe this as fixing a stale state accross reboots, does
> applying this before the tcpm patch degrade current functionality of
> the device?

I don't expect it to, but I have not run this patch on its own, only
together with the tcpm series.

Without the tcpm patch the tErrorRecovery wait at boot ends after a few
microseconds, so CC is only open for a moment and boot should behave as
it does today. A later error recovery opens CC for tErrorRecovery,
which is what a self-powered port is supposed to do. The warm reboot
with a DP cable attached often fails today, and I expect that to stay
so until the tcpm series is in.

If you prefer, hold this one until the tcpm patch is applied.

Arun

