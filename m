Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F43A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 06:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k+/gdf/T;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJ0za+Q8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=URMNcpQ5qqNQl+Xi1BHmKsQnDnwFJRQJWZlQPG3sB+E=; b=k+/gdf/TRqxV0T
	krP/rsp6COsPYTCa82gOPXpNG7M48HkVYJ6ZgIoGcLNabG3Oq3Y0T+BcZ6pfrcnCJvV2e8JX2IaxK
	wzwqKnbbqjPuo6goK/bMDgxYzR4/MSV3dqJ+uQyjDlBoex6l0VHOVGs6L2d1IGoDWKAhLDw9LGNio
	At3Bp3ESwjxNIMtnnMx+PWbQ5d33WAq0CguCHjsq/jDtY+szg6EZbD+uapvWU8vrKwKrtIA9DAeXv
	PFqK6jkyR1BNJrrhk63Jse34/LPwWqbVIDwqcJrNGvrN5LtOP6F0pW550B2tyPDzz7oiAdQxDV3k6
	8jRqh8B8nOdAJv4/Yt3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQImU-0000000HUKk-1hLp;
	Mon, 09 Nov 2026 06:23:02 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQImR-0000000HUJd-158T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 06:23:00 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-679965fb848so555662d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 22:22:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794205377; cv=none;
        d=google.com; s=arc-20260327;
        b=agvy1ZWMTWglIdUdlzN/sCADBlMrWWs8+A+mzujxfe6eixpFa0q0fC/awuE/FxO29y
         UT32ZZLdqlxGWdAR00iOu9kPub/lVKIEri1DOFnZ4j0RZlgPEYBwK+mprmpzmUpbfVJh
         DtRhayi9KxmuJEdDkChjlBiSWrbH++Swvyvd2RdhI4/pEkUjg3KsjpYG1bT7VvYbEGao
         ugmTek6H2YU0onqq6Et1sl2L7rpel66AztnZHIeVGvzKJER1+LLYSwv5rinUt4HqJ6Sb
         nX/V9tRUpfMeBiD3TG0NT9QhyyrYboiQ7rwnLZdF2V75zfjSCZRWYhfnb2Q5qVD+Om7f
         Ehpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=URMNcpQ5qqNQl+Xi1BHmKsQnDnwFJRQJWZlQPG3sB+E=;
        fh=DMpUj3tsEjIMewFhG8VyYcTz769JEQbYnmXEjCkngrQ=;
        b=XaTSy59AcrSb5KsErJY6XoBxA5G9OR89pq0JAfBgW8CDTiyUF7KR9H51PmyQG0k4QY
         zhLxr3ScgmBA8HCDi16nJIJLQiiLGcMkyy57oz3vgaVeA2g9/TtkSlOfQbh8ck0B/nxS
         NBl8KrE95rLEBXL/Fq+R9KD9vqQogoGpVX/Orl5F9rczYt2D38vJSRHmF5Oo/CfUuoq6
         Xtrneq+AK2E67Afwy+G2N/DJL+9rMW6AYYX+HrGMt/RBnveg2YzIhMYtBbduXOB9nwom
         gijGksGGUkTpgnqDoctCDLoPs0tkZ8WddrGnOBhdPw4dcFYthcXpSs5DB4DKtdy5g+Kb
         6log==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794205377; x=1794810177; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=URMNcpQ5qqNQl+Xi1BHmKsQnDnwFJRQJWZlQPG3sB+E=;
        b=yJ0za+Q8VdJ4u5Ur17Vo4+Rf7wxDr7VDkdz2rFjBjC5mQr0/VSp5iaJXSPIcXKxqNH
         KUn+QsFc+XgfzC5ZQfey1Z9DisvRRZ06p/rlynboMjnT0NclerVmUlcd7/t+2/7oQBaH
         3lvPn+V1iUFYevmtQgkwGOxFfHps08xcmK0XJFmqUxE4PxoaFdZ+MplNWQZ+vTKcKlIe
         5KV2HRKRT2K5FllrNurqVsHvXQczDc85Ra0AUbdwVWXVruF6nEY9xeab8f84nIV448XE
         EJ8DkEOJJqJYKgSLvthTp2NLTvd4OVeZXPojx59v++IDIdTFGDlZ2g/puCyTJmZgnFDK
         C/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794205377; x=1794810177;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=URMNcpQ5qqNQl+Xi1BHmKsQnDnwFJRQJWZlQPG3sB+E=;
        b=g1uyjq6zO+BiJ40Frn+4ThAvUBC+ydhPFOD+/MnSWAYuQn65Qwmc/b3DonviGDLApR
         75uIZAS/iB4mU+9Na/qP1HeMzGPMRoW3Pk0y3s25vEf3DRxq/7NqdgweZBgUFXhPxUBY
         cKecly3GsGcxWmg9DGBW2EtGwspc8cLYZsKeLoi2EXzqHGhHsv2B5kYRZQPiujDbUBay
         aYOx9kLA7NhliYFt4SKsUMNbGYNMBjkTiZQHjvMaihoraMfgscTnJEiE2fKWPp3daqZx
         d1HelRZPx+jzHMG0RGU2kB9ySgi7Sz3lzdORMRRNPY9WxuRtIYHKuGl2/2trl/3L80ce
         0b8w==
X-Forwarded-Encrypted: i=1; AL+hErFNVhYA7E8JsyfWlWkiBimRL7M7SgsXrmrpGQDGgYNO054MSoU4Bwmp3ZPNY2rYsSDhv0/l6IqtNQPTsv5YA3KI@lists.infradead.org
X-Gm-Message-State: APuU4Z+5THjiiefliB3PQFw4qqqV5f/QI1hnTC1Q6O7d7u5b0bUQBq5l
	x+IG6fDFwzGGwOhBwkPoG82ADG3YQpibVVQ9CeKGXVFvuclHKTm71wri4o9R/JI6JWWeT4U4HBL
	uL0fGnoSIVzr7WX48FhEzkgzVpuey/E0=
X-Gm-Gg: AYBFou1ZIJbIn58aDc2EaomqWGz0zTTYeHxxJwJbrKIDSee2miipmkRNPABjzdhIQ9X
	jiRzHjS2Ne+lFLuvpBo07ERI3KSScnAZLwt36rHyqB6SBns+iP26FRh6x8ZOm4hUdX2gvQS9F1n
	i1W25K5wUD0vbCaeFf7AJnjh9pDoGh/yt2TOzlIjrDJykFNoLTmZGzjQVCO4i9cRuHWhd8KUHDy
	MK+riFOQhedfFQ9HREn5aM/+i4GDd2SwV5wcUvZZbUYCiLpYzew36l0fD7SjAkSbhHdWZC+GHr+
	j0P7qeqntaR7bQKUEosauwNEd+qCBNzmkZ9+udHDjRAYJuTrJA0oMcLCuPDssyWuI3rIcogjB/x
	lryVsYQiJLUifzLaosvgyas4go2NCKRPciCkI
X-Received: by 2002:a05:690e:43c3:b0:67c:1fba:b465 with SMTP id
 956f58d0204a3-67c3d9fbc68mr1052892d50.48.1794205377206; Sun, 08 Nov 2026
 22:22:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102093228.2751576-1-thi.zirnstein@gmail.com>
In-Reply-To: <20261102093228.2751576-1-thi.zirnstein@gmail.com>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Mon, 9 Nov 2026 11:52:44 +0530
X-Gm-Features: AclHuK_068F5Wc70oWZbpd7SA1pDUlq5xu7WG9r41_d4oinb86Mlf6cH4ArzQug
Message-ID: <CAKfKVtH_SRTSyZnouwz3MEbGrtinbJLN=y7NzuX_mV4+MgKoRQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] i2c: i2c-xiic: fix clearing of bnb irq and
 waiting/ clearing while atomic
To: Thilo Zirnstein <thi.zirnstein@gmail.com>
Cc: michal.simek@amd.com, andi.shyti@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_222259_326006_40A32A00 
X-CRM114-Status: GOOD (  13.51  )
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

On Mon, Nov 2, 2026 at 3:08=E2=80=AFPM Thilo Zirnstein <thi.zirnstein@gmail=
.com> wrote:
>
> Dear all,
>
> This patch-series fixes the clearing routine for the bus not busy (bnb) i=
rq
> plus the waiting and clearing routines while in atomic context.
>
> The bnb is used to indicate that the current transfer is done.
> A high level view of the software flow for tx:
>
> * init i2c controller
> * prepare all registers ( fill fifo, enable irqs, ... )
> * start i2c txfer
> * clear and enable bnb
> * wait for completion
> * ( serve interrupts )
> * ( bnb interrupt ): complete completion
>
> The datasheet ( pg090-axi-iic, Interrupt-Status-Register ISR)
> states that the bnb bit can only be cleared if
> the bus busy bit in the status register is set.
> So the iic controller must have recognized that their is some activity
> on the bus. ( Start condition )
>
> Currently the bnb bit is cleared without checking or waiting for this
> condition. This can lead to spurious bnb interrupts.
>
Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

>

