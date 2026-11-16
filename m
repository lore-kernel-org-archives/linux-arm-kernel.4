Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F5B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LezSZ7A1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a3VbYEqh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=choMbSoYoRkI4EZKogv+on35PXN8ET4WeIfVWxIT3BE=; b=LezSZ7A1KOFq1n9Ah8Lpx3QWoe
	x01MG9rf211Q9IpXURFgZQt83gTvHXVLc0N18g5oXs0vyNBgaCGQErpe7itUNgJ7GUFATaQchKIg5
	2RxpwT1PDtmmc+HU8JEnAhtvTD8Uo7vD0JRp2O7Y9nVMqiJ5iKvrvg1JlaIVLWYA4Rllk/BdEe6Fb
	j2hA0TcIOBLhivMaHjOU2Kz0CR95T90ok2WpB5WaUBU7d8RwCEWWGusq0wrVJHZCdzN8JKqXhmELq
	OVQ2TBMarEWiGLwiDySRlHex/TTScWo66YexwbDOYJRPBEjUxs45B7X7t3jS0UyRtt1wOjJGISMtQ
	jjjgk2pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1qO-00000003g92-1b3L;
	Mon, 16 Nov 2026 18:54:20 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1qG-00000003g3n-1L3T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:54:17 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6b79f5115c0so6068524a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 10:54:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794855250; cv=none;
        d=google.com; s=arc-20260327;
        b=qCU+dvkaIFRL2MMmfcTtGjJjbrshX3O9nsL3Wd2Q0S/R9+423RNBClA9H4DRnbFu1O
         FBZevo5n8uq7D06fNaTzw4sRwOxHhFjt6psDIJW9XpsGtTWo2nB9SezztWBx3VlG0QEh
         SLkHUfGtdoUvc1KDmFBPwY/Ex6NnIV+MkjhZpplANU04KAhrZ4nxe43/3pGz9Z73+VWv
         YNjAq4v/d5ahMO3p527KOC216kK7pH49HtWhiF+MgW5Wa/EObjXkmAUOWTm2dpsHYtAE
         vnGUrC4l78Cm0j3Q2orHzWATPSJLGQ7FQefWrUycGZtKt3DDFx7gllKi4KI4Z/nGZolV
         5+hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=choMbSoYoRkI4EZKogv+on35PXN8ET4WeIfVWxIT3BE=;
        fh=cWFoC2boKGPAyAT+epJXZC35KCXfgZoeDfXEBBIFPg8=;
        b=E8lgClrJT4qbs53fbWXW3vi4xJAkzOcnej40668GK3s3sSGT9no1psDVY0OcTPcOuC
         FZt+ZtRsgSXgxf33D18BOiPsUcT9KMROApn1bqNP0wjh+e2mVO+GQlAjWGEbOVKHuQwe
         5ZOzv9C77QFslOACm6Ho2xJJSAA9sQpB1L4u0PfgLRi3cdxpPtMxnnDVXmfa45jjrWv7
         iv9LBHruyyxh30dQ8prkSRUpyneMAn/D6vJER0BP5MwaLoMXCdjhyGsGgv9jacyRXqlU
         RDpJB3+o+olpDCRMyYRJwSzllVxv0xkXID9osQ4WayKMOqVbxPetmqRdwGxYHxdFXUzu
         7/wg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794855250; x=1795460050; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=choMbSoYoRkI4EZKogv+on35PXN8ET4WeIfVWxIT3BE=;
        b=a3VbYEqhMXzxD9GMdg9093pSp2UDY3LMbKLM02q19wGVosgZ3CdokNZlQuKrkCRXxV
         km3qnttovBRv0ML/dxIZHVgY7Nmgh+tSlstmY8oqNQNQs6Mjl+Nz6C3GuzfMop7YrUXu
         x4LRZHhTcuzkOpa8Qj8E+LsYC7SMuIaGL2z1MYKPUgFsRpYfYvC42mJEdl9Pjjcm1E4V
         i8lAZYMfPzg2wn82nSpY2paMRTsb9rrK2ZI+M6Gl41SNuKyamgREiK0O/3GWUJJfLUy9
         fmMNpEnxt7KUDffVLlEk4Reqzs8eJH8h3rHRiD9p/qLzaiXLGsRCAUlbfp/IbqyGQ3xh
         ijPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855250; x=1795460050;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=choMbSoYoRkI4EZKogv+on35PXN8ET4WeIfVWxIT3BE=;
        b=NhgEsATwjUAPcr5c0Rh/xdT5z3oFZS6mZknKuNtV8c6ctHwujAvqD4e5IQVHyj5zeH
         XpqqrXYeBLq4x3RIPE2aiycg7aebIn1DFHP1wLOF09TuaibzftHb6U5YKb41fv5Q1VAg
         J0ibw43TInjxgOmyPyBcqgjfOGhPFIo37j6dhbpy275f6kvQoKR8R2sftjgea4nxz0nM
         2VL5j1xRptOtu3uFJHy40kVvsqhRINNI0pr7suZjF8hLOke2EzmZqYAMlYJrwVDjffd0
         EZaBx6JS0aNIDgsvqdF4RcPGLwkgvoyI0vMw0EZPH1Gfd4YHpYMlAoIfQaEFiBATxZ5C
         jCAg==
X-Forwarded-Encrypted: i=1; AL+hErF1mgw/2sVqXjw0zP9xR8N4O8XTCA5aR/m2pfXEXxeSQjRunMji+yWGsF/oVKrhENwTnfDfAtJg8HBYAGH/a1H1@lists.infradead.org
X-Gm-Message-State: APuU4Z8IvgyjvUk6bq5gKIe2HNlYv18HaJBzqMDlJJ3AwrCRsAx22MvQ
	rl6Yt2mwL0+vNuBthjnvr0DgjX3Bu+4VgI+QHw5w9bSoS7eDi8/tJesFOlRXa2KvygLa8iRY1JI
	UajrDHqOY+wqGqq8O+MyadUxJTj97ekc=
X-Gm-Gg: AYBFou1M5wwsRKBISgM+wSbRV68EEBxzwTNol0huCASlzHi87bSLDdzLuy5sgKOL8tz
	uK5XTFh5UtBS9d9emBmnYew4Dh7Cs/uAxrVjjv1jE0AQIEizB2Hn+nr0p7iPUcf0lEXuQwgEvuc
	PlzCZf87fL9GpO9mIv10uyuQY97u+rDvmhrNwTjeTvJD8zxbe915QGuupaqKIdYECLHI4Fd/qaY
	iGs6dviasWC0T4Bu9uEH0FziNtXM8iuh0Dv8se386Ux11KQynpfLlrfGfj2sfxv1cEdv6fgwRDG
	ZhJQznHus9nSyJs8nSjab6Ya/FWA+6Zwyg6S6TwH55r6F6MHQN48vAV8VVPudEwYsZCSn6m2aoU
	bp8c6tXXxzk5+2F/7hrwnaMd8VI9Dm6uszvM=
X-Received: by 2002:a05:6402:3210:b0:6b5:9714:dea8 with SMTP id
 4fb4d7f45d1cf-6b7c0d24511mr9592011a12.45.1794855249794; Mon, 16 Nov 2026
 10:54:09 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020122712.526797-1-l.scorcia@gmail.com> <avZiZoGO4jXjIP7D@google.com>
In-Reply-To: <avZiZoGO4jXjIP7D@google.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 16 Nov 2026 19:53:58 +0100
X-Gm-Features: AclHuK-ct3_bPqNEIOSB1NJrGGSJAI5u9bKqHSATB78hAxnxBRSskimQcv_9q0Q
Message-ID: <CAORyz2LNRfnvbCLe+49A5kAF4NSi0zuYdpd95+7=Hx=KQh0B1g@mail.gmail.com>
Subject: Re: [PATCH] Input: goodix - sync the irq controller while starting firmware
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_105412_392808_CD4A945A 
X-CRM114-Status: GOOD (  13.35  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> There is call to goodix_int_sync() right after call to
> goodix_start_firmware(). Is it still needed if we call it here? I think
> the vendor drivers does not do it.

Hi,
unfortunately yes, it's needed right there on the Lenovo Tab E7.
Without it, the REG_SW_WDT right after it fails with the error "Error
reading 1 bytes from 0x8041: -6".
The vendor sources for this device [1] show the call to
goodix_int_sync exactly between the two interactions with the WDT
register.

Actually, in the same sources I see no trace of a second
goodix_int_sync after firmware has loaded, so the existing call could
be moved a little earlier instead of introducing a duplicated new one.
I tested moving the existing call on my device and it works just as
fine (basically, my patch + commenting out the existing call at the
end of goodix_firmware_upload.

Which vendor sources are you using for your reference?

Thank you,
Luca

[1] https://github.com/lscorcia/linux-lenovo-tb7104f/blob/2dad69c9f28611ac6d3db2f1ee11b480a60d83ee/kernel-4.4/drivers/input/touchscreen/mediatek/gt912_p98996/gt9xx_driver.c#L1529

