Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DD0606A338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 18:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tz3ec7Iy;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZzzyARYY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lp2V1CD3UzTfS8SfEqnuM0AkFNXDFtv8aXVUJV8xgrM=; b=tz3ec7IydaoKni75bnpplNwhGj
	X3zH/ojozVcbdR7+ldUsbC7SaX5I1jpqWHkQXoupRINtKglT7aE+rMnoz2tv20y6UdWkkGXwFuF42
	OBOZwPZ1W12FGvtrM2+czL1X6at9YAfKbhPC7jLP198G+LFpzWERojSUT/foCx0vbsOIw8HKTeMCa
	AAuo3UCPjfHmaWjlkLq1teHwB4WLL4xlJugYMfP/8WIy4WOALkyaDuLdBW95ppnGe30YUPxoup/Lp
	GUZVXTP7RgFdFelCKYPzk73lVv6WQ2E0YKNaiH0rXOoRy/IclhhVnWMhwPPALvSPBj/8HMYn+kfH0
	gwc88New==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvA3-00000007UHG-3Jrn;
	Tue, 24 Nov 2026 18:22:35 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVv9z-00000007UGV-00Bn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 18:22:34 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-1b5786e099cso2825276c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 10:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795544550; x=1796149350; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lp2V1CD3UzTfS8SfEqnuM0AkFNXDFtv8aXVUJV8xgrM=;
        b=ZzzyARYYl6ppFv2mSKgwhSxPvM/7Us20eqAW1Y5bfAgAGxlUZ5tSTs1INFCFg/7MiI
         aqOGU3l7ypHgZcGPwe0T88siE+H5KESxB4pgcxU2UXQbjiHrQLLBL5xz9bpfBpLZvWyT
         rFA+B/tgWYVf0L67j6gwFdHn14nXs3KfE0zwKei4CdbirZyN8UYJTp9DqzVUfZzlYucl
         VW1UwIZz3DSWbUF/OlaYufuhesGimJ3ewX2zB7Hsv+GWDq/SaTa10oX2dltys02AqoyI
         svHpwij45E5f+jwIE6Luwk+PkR6NGTR20cPFMBf5zDBffsW/Z1oDf2OL72BGqSM8X8f2
         zZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795544550; x=1796149350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lp2V1CD3UzTfS8SfEqnuM0AkFNXDFtv8aXVUJV8xgrM=;
        b=1jrlJcXFOzFFQkG3ACv+suhRJbabb+GYADHzjd5kctq+LJykVkfyA+vBeRpnX8VtEB
         0L+d60akBUFbWUfkVX+V9yI9/xUm6OKzv2rh+XTwO0lkHipMsnOuA99eok0cDX4k10zs
         cQtFs93veuR2MlkMUEAEGLvQvcLfJ5qIOyvfIA+PQ8+bFKexrUuRWNXaECRthmxEw1b4
         dCBwki5FfYrrii86doFfBNE/jF/OymFin2+QAukFTSf10sR/SD269QW/h06uNoO2Fz4Q
         jO2WIS8x/iLxEQ9TgBbXO/9sM89vTt+HKfLFF495K/2/oG6waCbQW3blXuIdoqfwZ7Em
         DjEQ==
X-Forwarded-Encrypted: i=1; AL+hErHeV7ngRiNPEmKLjmK2YdIR9tUGYJYfjc8Ivs8gFUznqGB185vh6yoLrcJsG9iAGoqLSiLJPhAgYweNewft4yfD@lists.infradead.org
X-Gm-Message-State: APuU4Z/CpHfQZhh3346JxvHU7bu4L1m/b1jG/uwgMyBNBtohxNmZdvGp
	Py+61GtkAlUIjxZLUQqqjoFXi5jci5nEyPKTUVZ4GNw9GiQ4jGeYGIiG7PRtQLRN
X-Gm-Gg: AZFdTZfYA6KwJB+X5s0UT/qS+cygt7oDAFzfVzvd9jZylB/3hstPONpjK964PEl2+Qd
	dF97Xco85aO4CSEFSjqCizOu06p4dkXFW8J5nfcQUgKisoFT1U6FuOYod++RuxGTIrbnrzG8oe3
	oPSMVbYM/sm5h2Fmk7AxwL3rnm+x1J2zD5/xIVQWYW+SGaX5/gMS2GOz4r8tmZWJUHvaDDnZWh9
	DQJAX4I2vROB00b7XgEvl15VEm7AmoUjSJAQps3VBGDF1ydvwEteKBFmXSzj0y6W0lfk/oRJKLS
	d4mUQAOGBVmWRvMeYZn0g/a5EAuai9YgBNzKfyhq92gxw2oTir8Bi/1i1sKiL6MIcwHl34Dngb1
	xoYOHQNtfqB1zru0d2twkoJ0TBVS5xnfnh0KW6QS6rwKfe/CUFNTvA8sUZ7otQS1K8yRGkP4lzG
	PofXhAWL/+L/IhWzH528ifrTSB2qokAmwOHaGswIiYeuUmSIU3YskbeKyCcArrErj++mCAxpW/X
	bEFs2Otfu4Sw4JNQF5OWW7ToihjqAZHkbM1uvjwZpuSeaxM2Z/WRchyPriPb9yGJFGwrfLhZq7g
	KtTSrazXLHoIUjVZ4VZFDOz3UYkPydkoOFljek1EaCPxSNRGmfZsdvwsU4gvVgzs0TXKbJ1WBcQ
	XIEzmQysCbL2qKlMDEQ==
X-Received: by 2002:a05:7022:3a83:b0:184:992:c9ec with SMTP id a92af1059eb24-1b55693aaabmr20326331c88.38.1795544549929;
        Tue, 24 Nov 2026 10:22:29 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ee3b:b892:771b:3bc7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm40472836c88.6.2026.11.24.10.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 10:22:27 -0800 (PST)
Date: Tue, 24 Nov 2026 10:22:24 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Hans de Goede <hansg@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] Input: goodix - sync the irq controller while
 starting firmware
Message-ID: <awXV3Y080rMLw_VO@google.com>
References: <20261124085058.128173-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124085058.128173-1-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_102233_138292_292BAF03 
X-CRM114-Status: GOOD (  12.59  )
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

On Tue, Nov 24, 2026 at 09:46:22AM +0100, Luca Leonardo Scorcia wrote:
> On the Lenovo Tab E7 (TB-7104F), which has a Goodix GT-912 touch screen,
> the touch screen fails to come online after loading firmware, printing
> the error "Error reading 1 bytes from 0x8041: -6".
> 
> Comparing the upstream code with the Android stock sources, the existing
> call to goodix_int_sync should be moved between the upload of the firmware
> and the watchdog restart. With this change the touchscreen is correctly
> detected and working.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Applied, thank you.

-- 
Dmitry

