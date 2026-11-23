Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC850606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 18:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZX5rH680;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y+GJCSOe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nutOLNh5W4dTyqWoDODtl05Z3AwT5FmB7YX35PdwCns=; b=ZX5rH680V6nLt1Z5SeNPDGuTPk
	MGnRptWheBn3ARBQXVLbuRPG0G0znV2DEvHKBvqAPqSKYkz4l5IFg/v/S+9SKeBZ3zKqs6NQkbXfC
	ut1GNUAIrKOtGtxih6tUZAZx8EbvwTU5uhHtaO+NRHsaMqf0IJ7qrqtpti4oFNaZPg4OGfgf8LpeW
	cwgdo9LzplunA6GsNWwtEObIGZeXNJ9ZwhErO5jL7iIPuk6nyQGK7sbD/MiBQMr6oRPce7BKOIMo7
	6WE1HP2tPn4QaQ5Dt3jiuMwYFEhAS2+Slj7e2f6GFnqqaW3r1V8VyaJNxXJ5gqW287sdFaj1uNGK5
	bjdOchGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYbV-00000004Swy-2W5n;
	Mon, 23 Nov 2026 18:17:27 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYbS-00000004SwY-0KWZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 18:17:23 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1536001c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 10:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795457841; x=1796062641; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nutOLNh5W4dTyqWoDODtl05Z3AwT5FmB7YX35PdwCns=;
        b=y+GJCSOemGQSQ7sfv3qhDVLvrUttlzLQBTyQ1pkpfl7Tg6yO2hUOv4nyhICYyRXoh3
         YVJ92mCY9Cv9MAjY26nHcXXUgnZC4Oz/mBLTFnYosQgSRuEKAW82kH2V6IV9zG4iJ7pT
         Fj9h2+39Gyft/Cd42d6rkqOKsRUbATzdVBQjK8QlEE6TBU6fuaJTCu1iI+5NtseK96Xo
         u4jR0v08LhZZhjv4LrPgeEvEJjlSTOds4hIhNhA7xTTYZF2hZWuYdiuQkV/R+fNgsp8k
         YMzRHx67CARRm7/trvLUfeDRynAoOUU1kmpIest+fAMTWz31QztZwHntJfTaDAjUEWOi
         Q+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457841; x=1796062641;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nutOLNh5W4dTyqWoDODtl05Z3AwT5FmB7YX35PdwCns=;
        b=KiYaNXYNEQkp0ZFMPdYN30GWqfYWLZiUO0ImZP5WO6mciZawqIPEL7QBw3Cf/z9Ci8
         TUPMGt0pEt3DCYG+W7hQAtcL1dci5UbiujgEFfvDMJa22xS9njAT7OkVgD+HC81mj8Sx
         UjpbPVQHDwEZfQ56wFwCGHy/2ju7IAPUu0Xf5xe8LSfr2Hot85BWELZqhWGanGdYYHzZ
         2wC3df29kQXhc3d2xne2EIUwo760rG2PEHnXmgGxGIof7NMgMZTHANC+ysshEt6QUgSQ
         K6BjLo3nbPPE7TKuWPj33xjeEVkSH4C2YSGpBBfCCuRuGkM/CzqiOxFC6YvQtvV1kdVn
         ZvtA==
X-Forwarded-Encrypted: i=1; AL+hErEnfYm99oiDM4ofl+moED+/v8YPPm8KJmlAAQSB4PAiDP3iVxZ9AKyYMAw3/ZzgS1jgqqDzACGu1VLxP/2TclQi@lists.infradead.org
X-Gm-Message-State: APuU4Z9HXuvTd/fiC3JtfrxiSi/9/rDGW0zX4J/oFzLE4NbcMxTQ/TAL
	3emyzr85mxg/ngAQRHPe7f9gCa7aMqO7lSnB/MKiPWAYNs5d/l5+aEJV
X-Gm-Gg: AZFdTZcqEwG43f/JHvo91hjT3eOOAsZ6GhLN8dNLVX7sEsGS6YmKafS+tSl8Ich2P2H
	jYFVvxA5u3pdMXj7ckmtj+y5XSPtzblvAEnBaUWNGntAYlBzq7yU6N4pP7YZtdNfgbaX8rnqdbE
	jh2OaZtigkXNttZSeGpFZ3ZRx3jsUG6hFTuH+Mzr5mXrJEtJ5EyCc/QSBOHTWAp8igaOKXKmAtP
	geAXiE0DHif/+mZt25BemRwonkng/IkozN10yWwMN9I7JtDUcZ+q1iTto+F2BE9azChxyhQY+bD
	t/EVV5LVqiHGf6XV7f2vHLPr1MzuG+xevkbrPpBB5Y7G6oZdu18SA/gki2+K1WcAh4ipDrCc8UZ
	K5jBHL/cKqc+tZyXBtEyIdwVtZ8784r/u3hRmF9gOQtfExAC1TQcI++XR7VvuocY8nPq/bRbant
	Yvwyg9U7eE0PsmFmRezUub2iAW6Qu9Xv9MupM8e7aRtrcwZD/GMoQfyCxlS2kS9FXYifLC+Ejhf
	Z3O2XT5BCYxlta3bi/ITJFChXbqtGLT6EA8qzW3xvJCWSn+9x5XGvm2z9jZ23GzTMMfKUX2frjz
	18MItf/4B2LAE4qOgVqVeQtwYxYArRiWNnZZ5s7DOeFwb2/K0g4mo51KFwS4L2Bx/VPpKFeX
X-Received: by 2002:a05:7022:1703:b0:1b5:64c0:d2be with SMTP id a92af1059eb24-1b564c0d31fmr7645119c88.19.1795457840287;
        Mon, 23 Nov 2026 10:17:20 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:4121:d698:201c:9274])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm30439137c88.12.2026.11.23.10.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:17:19 -0800 (PST)
Date: Mon, 23 Nov 2026 10:17:16 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andi Shyti <andi@etezian.org>, 
	Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh@kernel.org>, linux-input@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH] Input: stmfts - restore touch after system resume with
 the device open
Message-ID: <awSDI1T2DjX63HlL@google.com>
References: <20261123-stmfts-suspend-v1-1-4b2276879e8d@ixit.cz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-stmfts-suspend-v1-1-4b2276879e8d@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_101722_120397_3B359EC4 
X-CRM114-Status: GOOD (  14.56  )
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

On Mon, Nov 23, 2026 at 05:13:41PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> stmfts_resume() only calls stmfts_power_on(), which re-initialises the
> controller and deliberately leaves it in SLEEP_IN, assuming nobody uses
> the touchscreen yet. That assumption does not hold for a system resume:
> userspace keeps the evdev node open, runtime PM still considers the
> device active and stmfts_input_open() never runs again, so the
> controller stays asleep with scanning off. On FTS5 the controller
> interrupt enable command is part of the runtime resume sequence, so the
> result is a completely dead touchscreen until the input device is
> reopened.
> 
> Factor the scan enable part of stmfts_input_open() into
> stmfts_start_scan() and, when the input device is open, replay the
> runtime resume sequence and re-enable scanning from stmfts_resume().
> 
> Fixes: 78bcac7b2ae1 ("Input: add support for the STMicroelectronics FingerTip touchscreen")
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied, thank you.

-- 
Dmitry

