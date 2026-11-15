Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D120D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 08:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NkzJudXh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EsLmvRlr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:References:In-Reply-To
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AEWA9iOD08SFA/zlaE7wGAZjLwI2QLYLqoPd1RCuPRs=; b=NkzJudXhKqXLatJY706VZGMYrL
	a0OdiPF/W7DuFZn1rfwLGEYcCG45fj/7EqU4Y8BI54PQfsIFK8qH/UaYMOWMpUMilMjWvI3h5LAsE
	xrS0GTSxoWtKQfmaZgzckNXOG9/JFDvvxjpntEx6JD7LqC6kQbtI/c0a3WQX/P/2cJ9+Pz4wAAJ8m
	EpwbFsvs9zs/QiuUokvLD5M29OFiNWyOzINWuLAGskZm3CrNtmvN3VXvwvxLFv6xRHJD/01QqFrJz
	fIeRpsV7F1stIYsSdRAl3IHpZSDM2cApuZ8RU5SMv6g7FeKrHua7UPPURtxfAT0ziG6No1FfN/zQf
	he9UOBKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVZO-0000000HEO5-1Flq;
	Sun, 15 Nov 2026 08:26:38 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSVZK-0000000HEMy-2snW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 08:26:37 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3b09cc7ed1aso319259a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 00:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794731194; x=1795335994; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AEWA9iOD08SFA/zlaE7wGAZjLwI2QLYLqoPd1RCuPRs=;
        b=EsLmvRlrq/KdtO75lYMgS4gzX8S7SFT94fx5iEgDUKp6Q5w4D6zpWVmOAepppDMbEf
         e0w7juWYQ/rp9IOBFgFIebxDSG/jfGF2q1cNVj+FM+TU+dnAkGrnHjpjG561GCqEklW0
         LbtFxJ1gi5mmpantHZ4Z+EJKqxytkoI1IHuoC2kte47oCmJ6wdICpm/qaKjDKfD1TYm/
         wt/C9i5+J+OV1mDa1yRyHlmoxFgiaOmXCqHcySEyEhp8xGy2RkTfRoOvQHS1F49fXB+r
         kWPAyJ5UdeZojUIoWjMRkTx9fUD0xHHZ9tQG+TmbW1f7AejPLyqZsGqCBS+PtQhtfhjm
         cLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794731194; x=1795335994;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AEWA9iOD08SFA/zlaE7wGAZjLwI2QLYLqoPd1RCuPRs=;
        b=dHVoV2JHi9J9ox7oB9aUQCYxggQvv33c8G247dUs9P40yPhg87NJKuwqbYLpKFXhQ/
         0N+/DhnCJP8PuTNSb59Ayd+nkZhy2ei5k7Aqd9kDMEyVKRbnYm0JGjs7YXm/lkCgid8L
         hHtiJSvMsRyACfb6WYY11cldqCyQIXhgLZVic1V0QWEa1WeJXeDVHCaIt8Ys5GBghkoG
         ILvADuWqTU0jYCl97KkrQGMnKlROAzKag2H0kxeRzRbBYWbQRphKHTmOuN/Gh2Uzafn9
         7C/i9f1b5wmMRivAu9jfj3aakBMYb/VYpwDaoWcAUDhkCBEnQ2p8bTscXEJZQxzoDv56
         iAwA==
X-Forwarded-Encrypted: i=1; AL+hErGBS7C2RKbwPpg4W1E4uUCsFWXzTfTUDCxnK06KM1CRGNnOy1Wwb3Fqd+DxzcUSA6YcuWRy6bS7gGuo1GfXxO32@lists.infradead.org
X-Gm-Message-State: APuU4Z9dr37ml4bcC3ek3L7J1WpPY8l0L8tPDzro0bpdmZJvJSBezF/F
	21SCr0iafM/LF6GWBviDG0pv/sjulz0MM8bW6+u9Olsmej4Mq99kEgeC
X-Gm-Gg: AYBFou31ZAnDyubiwKnvJpfhaZR7SR4bk0AUjJk8Y67DN+COih4LZujtQMWgtFTK1/w
	/WlETpbfYmR/lGtvH1wHRYsWSGICtGQDGXUj3LGiM/HhC7Jm8JTE6b9QuKXlWMSxX9XgISr59XJ
	7x6+Dp8AC009QgKWqqNM7NY+ItShWDyEbX4Im38PKu2/IXau3Ind2op9vDeh0xktr0VdD77cdOf
	cvrzgoU1r4nk/BTf26fkRo6zIVtFLvTVeKI7jLRtHUwp7FIHCJKFtWRnhYv3lr48g64YPCM1563
	itGr8zCRk8Tmcx/aGeRwwPyf0O64aUpdNFRb4EXRup/I1GXilXZcWJbgRSoVDJf6Hd4F0EgYot9
	AFI8crva1HRHucDw2VjtGuBD4aaFnf0fvpFFP/yXrJSx/lqirRDeVaybgEQozhBSrC99Blk6Ey0
	YMdMXCEplRLBlztySV0/Da98BfRmEgUZdRf+3wLhKx7N4NjDL7uXlV7Ajhzaz7AEzRgwKM8taqe
	BiwLPUu3e4dMybHILmT1N+qOMjX9VIm/SZYk43tZlVdVzfUz6cor0/0/oRyuQWmOvF2OiQ5EynK
	yZ8DOA1HooruXoRzJmsUynlXuSLz4dt3ytSoT83Kkrr/6Nq7MvKBDmvLw8L+rG8iNCGTGAEncjj
	bHd/SYw==
X-Received: by 2002:a17:90b:568b:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3b1b0815b27mr11488600a91.1.1794731193623;
        Sun, 15 Nov 2026 00:26:33 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm12961779a91.11.2026.11.15.00.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:26:33 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Alex Kazinsky <a.kazinsky@ideco.ru>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: Re: [PATCH v3] media: rkvdec: Handle interrupts without a current context
In-Reply-To: <20261113102456.4155237-1-a.kazinsky@ideco.ru>
References: <20261113102456.4155237-1-a.kazinsky@ideco.ru>
Date: Sun, 15 Nov 2026 08:26:32 -0000
Message-ID: <179473119253.4041300.13173694154528880101@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_002635_906383_E9290F73 
X-CRM114-Status: UNSURE (   7.09  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested on an Orange Pi 5 (RK3588S, VDPU381): 7.3-based kernel with media
next's rkvdec, this patch and my watchdog fix [1], KASAN on, 4K HEVC and
H.264 decode with the watchdog cut to a few ms: 5955 timeouts, no NULL
dereference or KASAN report. I did not check that a timeout actually
raced the IRQ handler.

Tested-by: Arun Iyengar <aiyengar1990@gmail.com>

[1] https://lore.kernel.org/r/20261115-rkvdec-wdt-stop-v1-0-59e687c6cc63@gmai=
l.com

