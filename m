Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8741D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 05:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AE5L9LHd;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IJJEPYRg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hUPfJWrPKXadZ6OdI2hx5l6Gvu+kVXSB9AVbCboiOB4=; b=AE5L9LHduIJyXj
	OKBGqpiR0k2+1rN66F49q911uF+Lpb/1RAaD0ozxYJFULrkdxR/6PbqXT5bjLdByKzkvPBzfEnk7G
	Yy3r7l3nrtaC1E1XerNrUm33jslB5J00Zu014bglem14mV1JdB9PLE/Vl7SHL3jl5LZHpV6T2tMup
	cvYX0BKHej/fPriC/wLR2mIL33q7DleB87e+TnEt2sAwIQC+uXrHqVFCxUSzfW/Ji/7dN+716Yi6u
	gGO/+QKn1rS8piVY+EszDKn/rA0p+rWap9f1SjpRPNK7ojiUFbOs0JptzgfW9FkAxPN8GV3ngH6U5
	H5QKHH5KVYCE0FVRrLyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR0sc-00000005fNz-3j6d;
	Wed, 11 Nov 2026 05:28:18 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR0sa-00000005fNQ-1ZFz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 05:28:17 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3adfcafaabbso26011661fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 21:28:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794374894; cv=none;
        d=google.com; s=arc-20260327;
        b=XFVn9+qYZz8bJfWGzfxg9/Cy6HVYfAs4j2Bk40d/qJUoJJ4+iCSIGyBDB4W33RsPXT
         C5D7smO2pKZ6pIVEUKYSGku/kQh8bASLQa5cSXp3TEUlxX9KfxVf1BqFDVhvo00NyJ1T
         QtKdywZnpc5zt8ss13+XRcWxIRBzwwWr2KuiNfXzacc3fI/AkSIvHLrG1Lh2BujlGiJ0
         d+ZVbbLXT19NJ5xikRqUyriC69ljjzoOYN64SU7YoYJLqII8PJHFc0B1y6vEysgDpcHc
         LcD8//0Qm4NxwYbDSD8lZJof6vXgaTSxzcrdGBGZSlBUucphPcPaiUBAH3KPgee2+x7l
         vhvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hUPfJWrPKXadZ6OdI2hx5l6Gvu+kVXSB9AVbCboiOB4=;
        fh=FVWeQSBSGiSUbR8JVxdvdxglrkgyhOW9KaViyq4oHII=;
        b=byhEQq77gdgVPiHkSXZHUX8OvnzmYfKMmmbuP7EEi6gQ6y4B7B+i9/1VM9++KPjC64
         fa3iRlJQYm/VfJ3S+ztl2t0glU943XzfQT4RY5ZKtNxphj193wXssJ11kUd9zJG7QaAD
         EJfDdxzezJI9oenETpUXHzKgSbXp080yZGlxw8c4IhlBPhbfk/k3ySVGpKyj04H48sXv
         daFIXJ+dqIivYbQwgESx8tn1pstGuWgzZjdym6bdobzIZbLUditZEZxN0y3UK+BHxar4
         Z5BFY49DreYfcQgDzNf4r6XKKJJUWN3TpQk4wIdt0FQKE0EYeIMIFW0OxW5knL0WOb/d
         Zkwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794374894; x=1794979694; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hUPfJWrPKXadZ6OdI2hx5l6Gvu+kVXSB9AVbCboiOB4=;
        b=IJJEPYRgz+XUXur7UOIP2863r24xNuLg+5VsscUytfJgGx/jM2FtUHrctKDn/Bdzzc
         LKaXPKfpMb2s4XiSMIRH4Vb3uVhic/DeEAobgnMb72qlYjgGpwAY+BoCm3TnIvf0dLqm
         1lBa/Fa8v0okvjdxupPnVTqTk9Y78RIPaYgQ+Anttlp3FgYSm/2F8qjNax0Z9aDixmC/
         Uy7+xchdIVGZ6GGKPG1ru1cOZ1FX2dXNEl13AHRSGk6VEJlZLp6ppQ93m8EDLXAM5VZo
         TiP/9KB3b56/DFNll6vhJfG49hmvz6OjiJsBqe7Tk9PsRlkluf8A4VkNRGMAbfCqll4c
         MYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794374894; x=1794979694;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUPfJWrPKXadZ6OdI2hx5l6Gvu+kVXSB9AVbCboiOB4=;
        b=pvMcX3cYmIp9oufPuu1E7Z/LtjVw63gzdCDJiGDFl3pP1rjwcI6mkyaLcyv+21SjJW
         sTN7QfjcZ6L8E1lGWoKVkJ+11bte/5MxNnZiMvRjpEI7kHOiykU0UBk9AbSnwo9E/mX4
         cI+gpCFwJs8lalnkychrSVF6y0TK/SaXt56OxMaZrNKkurg3gvbtpfJw/bYLUz4tWJmr
         YrVz+x2m2R5xZSIMUskmNO6Yn2t4N5GrH8+YN9LIq/EHqy6UT8aeg2mjvYwMeWo+91Ou
         znxgP1uQqda7MT0tI8RkLH/lIvkdqBlkcYQtXEbjjKr7os7/xgXKhBrEzjcnQYamMgkb
         HxFA==
X-Forwarded-Encrypted: i=1; AL+hErFgQBMkfVSYhv0nwcwdpUBT2wsiutbLQzDmPbCsxcMDtrg5YLtQ6xDDncbSDPqXCwcv/23NPOO962mpqJmEmzQt@lists.infradead.org
X-Gm-Message-State: APuU4Z8Pv3TEh6BfUD4vWyVrY/p6p3ROeD9DVqhM+NrPLKuq1HoYKOR4
	IxfGztVeAeRJnspo/x/nZKyu7/Sz2aLpGMbQ4XbQYC4GuPWrhOQE+bfNWV4cMt3MOhCOTEAPrgS
	0ON1AhuY41VH/HpuiofAT4kB4QeS3xsQ=
X-Gm-Gg: AYBFou0myRpPbOzmqUHU1KYbDqOSw6gDRKKNapXAS5oV5J5ZKDg/fbm/pAy92arodV1
	E4b2PANlJTQqajb+VvR7mvoVPov+7Nh5wz6YcwjUYkokRfoCjyZFTAv3+22FXpomsBIs0lnxYmo
	UJdsNdedYYWRASKs7eMi3waLuJ+4D9VHPDbb79e1Sd9yDX+mQlhL19r/Niq0lcF/9bmiDtaheSI
	CCIBitROO2h0IviNL843LOffIr9LTJcBQKU8r1ZX9piw6Wa9kzeJKTKHXSsgnsrrIYDWPdqfPVP
	UTNY3tMWLUQD+hdYg0jU2Dl95lJU5noyHH0PvSwCJgmcmrixqw6g46jODgDbJ3lH6Tn0k4oHQCX
	hS+lOz46KZlSZExXBYRxsuJ2/cm84r8Z4+YEB1w==
X-Received: by 2002:a05:651c:885:b0:3ab:3af4:c2d8 with SMTP id
 38308e7fff4ca-3ae126de2dfmr1890061fa.28.1794374894004; Tue, 10 Nov 2026
 21:28:14 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com>
 <245d0e9d4043c0957716a6a32985b6ea5a8cb9ef.camel@codeconstruct.com.au>
 <CAF7HswPYb3hOWA7P-d1zASvd1XzaVeuBkoqz5nXHuDeEAXDhrA@mail.gmail.com> <cb3d9f50467089c6b13ea83aeddfb032c046848a.camel@codeconstruct.com.au>
In-Reply-To: <cb3d9f50467089c6b13ea83aeddfb032c046848a.camel@codeconstruct.com.au>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 11 Nov 2026 13:32:41 +0800
X-Gm-Features: AclHuK9X5Dqhm5-z10kEg9eblLbAlNWS5sD8otV-cBTsQml1KPQHVi6FoGfBKpQ
Message-ID: <CAF7HswNubLB9ZJRsJge5_YEGY4xZJCWaLA9k+My_8HcmC4fRzQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: ventura2: Add LTC2305 ADCs and GPIO
 line names
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_212816_429265_6C0C25F9 
X-CRM114-Status: GOOD (  10.02  )
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

On Wed, Nov 11, 2026 at 9:21=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
> Thanks. Can you please let me know when this one has merged?

Yes, I will do. It was only posted yesterday and is still waiting for revie=
w.
I'll follow up once it has been applied, and send v2 with the reworked
cover letter at that point.

Kyle Hsieh

