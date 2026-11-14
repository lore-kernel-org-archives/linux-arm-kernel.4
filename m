Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB673606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 04:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WGhajGtK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ec+L+orn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:References:In-Reply-To
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jlWU+LetvIC/3AgkoO5NcAsGhswOcH4rtrYp5MfQMCg=; b=WGhajGtKQcTk2k5HQDwO60mU6U
	KKvgSNjaPv5Q4hyfcnbTo3EBpkby3H8iTdtFwW6eI1QQSqmg9ZFQLuu1GH35ADr1Ls3EE0jSkI5FX
	5GuDaRP3Tet4uB20mSwZajwM260fn6dq7k6ZmFmzpnsU1tPyIPAlMajpZJAg4+87ksdnEQjb11zoV
	fixyI+sl6+aIoYuUTWWYdyoaiQqmSs7FFL+cwqhcdvkJZm1yO+9At05JiEYytYZjmlV6RRccZxbeU
	HVs6icvgyhrsJ02ffAOFP3VuMYsvnTJTu9PPRPupS+Gmd1cL04fC5WCkhz6VhAuxLVVttsEJ0eHmi
	7o1yGb5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS5iU-0000000FPmC-215h;
	Sat, 14 Nov 2026 04:50:18 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS5iR-0000000FPkq-3jbh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 04:50:17 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3b1c2c31a6fso128379a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 20:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794631815; x=1795236615; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jlWU+LetvIC/3AgkoO5NcAsGhswOcH4rtrYp5MfQMCg=;
        b=Ec+L+ornYA9V4I7YJmj0WU69C+g/sIH+PbCx7aXPOUQWBpA9Z77bjwT1yqoj5ZIAn/
         tSgwPiDUtVQZL8wdI1O2Fwf34sJSK/1iOI9jgZGDq2wdXXZzZlcn7kDk0ElcuBgyl1N3
         lbaLm08f3hTY34C1+KzjQKlE73zEmBbUVczRDpqu6vQX6L6kU2vQIEbWQtiqoBV6E/vn
         7Fmk1j4VCZXNFrUg7WGUcJ8UFgUhM2C6bwCcm9LqdcFT/XF/PVJrDbq5jjh10B0hfvr0
         R7vOVvVG8UtmQDtHY6Ny0b8cGXU8P3C8JwcJ6gsAr9gkiOGlqpPDpfn55YbTix9DCJAE
         oogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794631815; x=1795236615;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jlWU+LetvIC/3AgkoO5NcAsGhswOcH4rtrYp5MfQMCg=;
        b=aBwIOUhtFRadO5V5G3RF1OEyRl0B5KiK0jbewhVTTu9rWoLw+0ln5v4dy2AberAT2y
         NG+94mIm3/ibl+VpYSFdWy4OkTudNzXIxs7cLq9QFANBZ3tsm8yAwkC2vS8iiXZiNmhH
         Jyb1nVrUKq7SqTWVAc3G2L2lbO77lu9NDibmZMt2B5uo0ARwNSF8cPRkyaRwohphWUze
         ifbauSgSo1Q44U+ieHPUydLZ0tV63MXA2Poa7Qy1+abOqyykMZ1Rt4KwHlXUQ5nuvUIy
         P72JQxtXLOAmoCCbHgfAYi+FfBN4exW4mGyOub8rUlTcsseu5TO517c+CIhkjcmW6cMI
         dnYw==
X-Forwarded-Encrypted: i=1; AL+hErFfV1ScvxymVOL/ZKC/JsNlXkgqqeUDrF9ZqC2i5fOAdqOVkEvIykgjhA+v20MvzGfxu+MMufc31rbf1P461FX4@lists.infradead.org
X-Gm-Message-State: APuU4Z9WvNHw2SU/OE9Q3jztyPncYJ7eR7yA8JzeIk7HmmdD6GWhna9J
	rWNubQKPnRqT29RbLpI1XWNHcAiDJQxvHYBG2BRx3ivpIwencbWkaTwC
X-Gm-Gg: AYBFou0jCppYrk31sz7dVtpe0TP1Bvk/UHcQWLh9SLb2Yp/02lXzLv+3VHXyb6Wug0r
	Zo5QlPy0DmHQ/qsk+3FgB2G7d0S2N//4zf4jym1SM1qDQygqApOjzsFoJTflWDCTSemg+JdXflU
	S2bc0418Y7NqRAvikMeEM30bbZh9bJ7IhWBwKYLTq1HIedeinaEzrWl6thoF0TaS1t9A3XQsKIn
	hiOWGHoLvtMxC0p/PYgp03gE+OD0h1ntjucx6bvKeDayP+v+2FJSv5cV2HkhQWwXvRTfvYqk2cO
	tiKlrEU58iR4uyVrl2jaFRa5vOOi/MA+T4nP4foN9TyRgOxs7sP1ClZCVokGoakhO/SEvGNjjlI
	CKGEE+Qb0Qz81vPw83Bgqe4E9/dfmEzfvww9++Pq1OtrXwP4v5cegjrvnjgmrd1KD5+XrYJb5Ct
	+F7gaerBZGD+z0r8ydfVMVlX1E8Y3jzkyGLng6X2LA8pLwTwlJ8Sy9mULCI3QjPhmkeivlzwZSl
	Ul9AOKsfacJW+AtqC1+cGFVqlCOhXSqdCMAg7mL+1YXTpO0TmdAE4R5d2AG1PrbdH80WQLINHB/
	Hyk8afxHGuMDTFDKCvPA9B7T1SeRj0EEoMONmZoYWv+x8hWCKfPAcQMD8ynmuOY1FaphsKo3i3a
	k7RsW4RM=
X-Received: by 2002:a17:90b:3dc7:b0:3b0:9e2f:cfc5 with SMTP id 98e67ed59e1d1-3b1b0826e52mr8146982a91.1.1794631814909;
        Fri, 13 Nov 2026 20:50:14 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm12649072a91.7.2026.11.13.20.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:50:14 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Heiko Stuebner <heiko@sntech.de>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, hverkuil+cisco@kernel.org,
 Jonas Karlman <jonas@kwiboo.se>,
 Sven =?utf-8?q?P=C3=BCschel?= <s.pueschel@pengutronix.de>,
 kernel@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/5] media: rkvdec: Enable multi-core support
In-Reply-To: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
References: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
Date: Sat, 14 Nov 2026 04:50:12 -0000
Message-ID: <179463181227.3521962.172866405609790742@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_205015_935010_BC7389F6 
X-CRM114-Status: UNSURE (   7.19  )
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

Hi Detlev,

Tested on an Orange Pi 5 (RK3588S), v7.3 with rga/ and rkvdec/ synced
to the 7.4 merge window, together with Sven's RGA multi-core v2 (whose
patch 7 already carries the export of your 3/5; your 4/5 needed a
small hand merge there). Decode-only, 4K HEVC streams in parallel:
1/2/4 streams 105/202/206 fps total (single core: 105/111/129).
4 parallel 4K HEVC and 2 parallel 4K H.264 streams are bit-exact
against FFmpeg's software decoder, and both cores take interrupts.
v4l2-compliance is unchanged, with no IOMMU faults or timeouts. Not
tested: 8K, long runs, runtime PM idle cycling, unbind under load.

Tested-by: Arun Iyengar <aiyengar1990@gmail.com>

Arun

