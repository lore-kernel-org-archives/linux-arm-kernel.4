Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1452A606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 11:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N2VhpJf3;
	dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.a=rsa-sha256 header.s=wetter header.b=NJ2cD2CS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mNlgzKi+M4UaxHj70QFOPs7YB28ww2lTrN7u98wXvx4=; b=N2VhpJf3OrFDoR
	3OTKrRUx9AMJHL6ASUt8HJ0e0phHD+DbVlJM1Pzcs7rHyxJX6f2xmtU4OSWE4FLVhYTmZ13pbUaRB
	iQcRRe0enZbPawyWIq2FDnnxZEj6QwsiGI83MGAYpUsizMr4+MjIJDjA3+uyS/QwpfA6L1vo3jDc3
	JJc9isfd75HA2TQMHE/v1jzrc5lABUFDAn2lJhhARiEl+ZLDqd/nffRiiHVWTR5wKbGQjxCprn+1h
	vQeVFXZhBz9daHDddhu07KQ8D3ar1f9WugMI1QQUZwcX5F6iCmcHz6QxFxJeaP6IjsmtTY5mM404v
	K19alJN13Kxnz/lVMEOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0DK-0000000Bgi7-1Y5W;
	Thu, 19 Nov 2026 11:22:02 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0DG-0000000Bgge-3kXE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 11:22:01 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5be47aa555cso2476344e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 03:21:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795087315; cv=none;
        d=google.com; s=arc-20260327;
        b=lZZmONmVzrNYMu9UeXIYRWuCR/H9N1D31c5EZ/2agvh4r6nQ8alWZS9k0iYyWJjpwL
         yl4Lzn6UdsOAvNVJosQjJUGfxk57v73PhxGleYL2yk/o5fIp0FSTlXsWANttFymFfR1V
         kuk8Ep7amM4irvsurPlHgzS9eYbtEgrgSO8Gz42KWBzyWI6cCK4D2kfa1FXbtzBaHjoT
         fIy/9jxrCkHj9UYG5BHxOWfGIQKzifzC5at5nmwAyfAkEY+Tn/p552FV67Y7slqBfnRY
         YnRKnCLDrFHubG2Yf3gq/712qr0OIdJU1JNIRYe5Qmn5hiBH+hfX0HVO58enQU5uNF48
         03WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mNlgzKi+M4UaxHj70QFOPs7YB28ww2lTrN7u98wXvx4=;
        fh=qVHKzBME8j250TvQfufAcHP5z75Uj16+eCxHDyiwge0=;
        b=QkfcVYsLqdq0bS6XbJdZRsCQURpFQcde3N/Vb/7NIJ/ulKobffhV4xj6njx0z6y13W
         7HvY8/p49Ly0wulRqci/TrGpO0grG+lylVkdJVnCwcN9sbWaecfah3DAD9DBTVr6kBF4
         5PWlbEnuzuTyova2Zfzq2Hbi3v+gK4eXn7B1sYE+BNHDIF7dCGdc+//YdHJAeJqlNrI0
         NRfTWSYAgdEiQ6JUzI7pPdLHoc35nJhnwviWFM6VI+8BnY5qXTObmQNUUxiwVhkdxh+u
         thW0/mSbiE7NNf2DFs5fDh+CwF03FE8sQp/ANqgYkPKKnBoVvUMPZn/7cLPIZa/VYFgg
         iXCg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1795087315; x=1795692115; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mNlgzKi+M4UaxHj70QFOPs7YB28ww2lTrN7u98wXvx4=;
        b=NJ2cD2CSvPbLsKKIq6L241duKF2ISUhOVT2LFM3sZmlEabq8jA4VRdRgylvmz4TbAn
         JCMh85Sq6ziQCgbfg49GDoIsDqpD/kA9njlatJ77KTJTJ9xlCRi93o8BYDg+yZ4XHDQH
         6xQrJmXTV1+QlbDnbf7xURSpE/tKB0ZqEQbTZ3QJ3SwPhhSC76Hmt+S+LG4L6/02163O
         di7vAHIhpjmENUcygZRAWpivoFv/XJNa9Q4TJ8abIenlCOj9Cy08CNAQZ07SzQfNsPhH
         utFQM3ks11MI710zz847EmDVSZehhiG8qiXy39y2GWJvBHBS6Kep/3RVUWzEZeHyj+gM
         ekJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087315; x=1795692115;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mNlgzKi+M4UaxHj70QFOPs7YB28ww2lTrN7u98wXvx4=;
        b=M2YzKJouEPjKouUssGSFY0GR6cQWczZWWBiLq6GQadyQ+Vt6Eci/1PnUyydeXTFuU0
         fQLJGs41vJaVPVwrwfO7gRpVHmoWleJhASWL1etZCo3Lmiulb+AWlj+OmcPMyR3aQSrJ
         to5J7NQWq7xDwCw3tCtjYod/ar/a1t2L7SwXwuIgvO1jf8CO30nLAXEySR/GnglUNayv
         LeQCrGXTGHpJFNlZbLUOWLslNTCbyAhLRY17PSdnoKf8aCdjLxJCmfmhgRKtv1MVpdS0
         J1Y2zTtHj4dIJYS1fU+SLHNbSK/ArtbYkNkC+Tal/Vf9kx0c3yz0USoTiAuk5LTgYjlw
         aLqw==
X-Forwarded-Encrypted: i=1; AL+hErGVtQvxFHFN5gUKUqw5naRsaLrYy39eeOFPcc5aXyKV1+n+MyOsCSdiwmdiXF6ecoQlEiG+mbRUbTy3m1VrpvkX@lists.infradead.org
X-Gm-Message-State: APuU4Z+tkCpReH9k/0P0JhWR570+URShao9ZxAsmFPIteGHfOo6ikDTJ
	7ASfWOYVSc801HTkmW4N1UuqFJ8SN/OseGrg+IK8xwzgQRbYAeYC00j9lHtyiI/QqKzdAuVxhbc
	dlY4trvghUkhoyGBVfjJSBi44+s4geTyyTAa4+cXEVQ==
X-Gm-Gg: AYBFou1ZZKQ5BiCZ1AcxWH1vtTYBCs6sb1saAgVX9TBom8gqWdJ/Tr/8caEwXd31KQW
	WUwuu66VJPv8HsNzDaXwW7fBVSKY49H3zKesA9Rm4+3NmfJcdoGiHQuv9l7mLKKsgRtmyXYQv8F
	uxMteXDjD0gGzxtJGQldTQPaET82nPZ0TYRKqb1MQWNSix+lda4h7ov+MHPU6rLXHlnkX6A9ZU7
	DmO/3jX96qpFPS/oWfv4zELAtL44EZBn8D7COlRphqIcjarV2XVAElhvPMME4m1G3iz8xRz1y05
	O+minembxjNnMyk2H+Cr/1SLYhAZzKyUz5y10rddbz4MhA2cCr6a9C7CS9MJ+qsBpJiIur4vh/k
	jDD2+S1laf/G4zUsI9HTQas7unIMNvct260NRV2B1PnFxcZSQi0BkedVHogHTss4ePs7n
X-Received: by 2002:a05:6512:3ca9:b0:5c1:4f88:9af6 with SMTP id
 2adb3069b0e04-5c1aa2b7f68mr1862082e87.54.1795087315464; Thu, 19 Nov 2026
 03:21:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261022082927.59030-1-martin@wetterwald.eu> <2026102218-vowel-plutonium-629e@gregkh>
 <CAFERDQ1GeAwFGBQ09eu8p69c_b3_CzAeEfTwiEaVCG_22RQdtQ@mail.gmail.com>
 <CAFERDQ2fm9u-Y3DGTFNMH+K95gnE=aox1YogRWPwGFX+6Vrghg@mail.gmail.com> <96e08e3b-f034-4d69-8b6b-4a094cb39b25@broadcom.com>
In-Reply-To: <96e08e3b-f034-4d69-8b6b-4a094cb39b25@broadcom.com>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Thu, 19 Nov 2026 12:21:43 +0100
X-Gm-Features: AclHuK_QkZ_OGawTlhhrvP9kkbP7VHlaRBS7KCVvE8WdQdIzwGrIlALNsg0Zi28
Message-ID: <CAFERDQ15_=_8a+0nYqE9ef_W8NWVnhys+mSRbkXtKtymDixvMg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/raspberrypi: vchiq: register bus at subsys_initcall
To: Florian Fainelli <florian.fainelli@broadcom.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Gaston Gonzalez <gascoar@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Umang Jain <uajain@igalia.com>, Kees Cook <kees@kernel.org>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_032159_309297_9335371F 
X-CRM114-Status: UNSURE (   8.87  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 14, 2026 at 4:25=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
> Sorry for the lag Martin, I will be taking those patches from now on.
> --
> Florian
>

Thanks Florian!
Thank you Jai and Gaston for the review and the tests.

Regards,
Martin

