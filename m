Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F4D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Rf1NgsKB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cEV0TAWc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sA6A+HVLCaq1WHRrrdPMSMYH1omsgOJBkasA2HvpXv0=; b=Rf1NgsKBXgyPIt
	EWPt2njIAx0fOHuNkXPx2fgNUCGkYwhgszJagZNjvEdf0W9gouCL/v5g1bg24PvlRojip7PCSTI5L
	3n9W+/AnMkG7TkbhFo5T32K//cYCUxezeUs0Bebi1swF91HmS+CjWnM2AVzrNZHpGn/kDyWxbLhGw
	G6x+iOVFfPXCdj5nkkqIBO5W1JZ9MUIBr6usxW+20eoZ2LqppzevFU8cB3RznzOknMSQElMWsIhMq
	DK4EVOznu4MgvPjWBatZsb9wT5nMjxZDmqJtV8HFL9hrRKxXTL5F0q82l2RGZ/1ar81qIQ2lu73LJ
	PGcS2tSwro/M2Nab6SoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQOz-00000002iv5-49WA;
	Mon, 23 Nov 2026 09:31:57 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQOv-00000002iuE-2v7b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:31:57 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-67da62357acso3886037d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 01:31:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795426312; cv=none;
        d=google.com; s=arc-20260327;
        b=UauUvKbOclZNPYhaYq/LHGpils7D08D7NF1QDKcQRDNwVRPMbeaXw6+EaW/6feOlyf
         hiHsgqIDRobLOa+dfogeUAt1CsEZjBcYxtQ4H1DzDos9C9rOlnB6wMOWnSRKV/xX0g5f
         I+3ZG9WNB3U5yhxGWyV8XsTvHvnz7XIEAua9OQPMkvF7y4OSVfrA+pp6VQCzldTNbhgX
         isAmov703z8p5hQGAGtk6fk2M1cANi8HBh3/+czsDyBv9UB/6ME31eoGajKbEQGRrk7I
         h1CTn7GNai4ykT8CgYu14BEQ66XXyPokjnWZpJygkB7XWPD5+qklrM/DOuAip8fFqo+M
         m+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sA6A+HVLCaq1WHRrrdPMSMYH1omsgOJBkasA2HvpXv0=;
        fh=ps77vHhqCUt1QGPhZNW/DyvqOqdAUTdyyuCMiwDjgqA=;
        b=V+oQILCq32zyQ8FL/hsNthDlj5KaqjiI0b0fp4F6+s0qlaR+5OW+w+MMFO07z/frBr
         VkCIy49As+YOG1KJM67Bwy82CrTXYFkV8mnPrdT6RGj1jmciGn+meccZTAPOLxdH0blw
         bvZrFDecNA+q2Tck8JGDt3XyVG7QDHbY3CcPOp4fTH6+2B/5e27dFNLRddKVC/fJUL2N
         LCVQUQG0gUqaB44VEf5hFha4JCGazO53KkImpV7X/n5NocmePhDeTxyOnwfk9AMYBK3j
         KavgZ3BsTyxE9zTBeINWFg0WgH4hhTpLM7iMMiGzgUZUhiJ4HNi9e95prPLULyngczpY
         WvLQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795426312; x=1796031112; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sA6A+HVLCaq1WHRrrdPMSMYH1omsgOJBkasA2HvpXv0=;
        b=cEV0TAWcBAMOfQjEncGbG7fov/EXVzakEZjMiBtfIm/rqS01HWNiMEgTdoKd0W1uwA
         BVPGMGl8AF96Rcb98WHynT0XBjydV16GV/neykZ9ztPpkDAXupbYj17/8/3BeTYa5LuP
         2zGQ9t60/SpPh8zY8KBA6kFk8LqhD9QMienK4RXAephmoO0ofWoHEPq1ISawLdS5hCVo
         K4Wy5GtSzexGTX51nRrsUOGpTvdgH/1zHJ3T6eVpQIuQQjJPXUJV5o7UGLg2bHPxwNf1
         jZyMUPdp2m7OGOnj2xopk/SpCxp3ply7eBdNVwG6eoANlRFISqnGAp2Z9f0lIOzwr761
         k+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795426312; x=1796031112;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sA6A+HVLCaq1WHRrrdPMSMYH1omsgOJBkasA2HvpXv0=;
        b=qtvNZ+hwp615RzMMIDsjR194jL+Pxfcpz/c9syHo+WrUxkWjLj7exsA+hwkhyPl01l
         K3XTs/QvBtQ05PY0Pwp5ezWTG2Vj+dMDSfzJxBk86V38fWTKi5Jir0CtR8EFBQ3KSePU
         6SLc7XILXRMbToUgkfTC7mSIygvYJ7h84d3++rKMqnfUbARvItOSKnWFQXvbosyS2n1L
         HoayvynKp/nlxisP44YU+xfGDsKNEDh2bIs0h48I6F4cRjxrIktGmtdt3A8IMtBDdtu/
         CXyFyzDLQ+wkBDXn5942Ta6b/oukOrh1wjY9PvFBFEZhyoAqLrKHbV0kT520dILvD0JQ
         g+WA==
X-Forwarded-Encrypted: i=1; AL+hErHLfW12vNtmAkgepho/nD+a/W73eCuVRMTms/Pmywtzr7pYP5XUZ8FDHptz4iR5yyNZUo5PmxepxeRxW6QP8nwW@lists.infradead.org
X-Gm-Message-State: APuU4Z/Q/T/MXhvMyDSyWXaAWV0H+0QC0KhULQBaMSazBd+dH4KZWDPa
	QQDF4ZDwggkyIFlygdTz8J4y0Q3G/KJpt84ctup8r1mf01mxxI9qn7DxaI5ztPLQMMjqeQedm0O
	yUTHHXpbVFbRZRH/XzRC4ytPD9fozolc=
X-Gm-Gg: AZFdTZfjUt5grNmvO9yOKGfjgbZXLBxuSUeEmQa8eXHjF5TfO2uMGSZCz2Cbn0yZmhw
	wIW4eL4biMdkRWyQMSpkEpWgOhHBwU90o7Iq/S+GdSeyAxMHggrQbOHutG+uctgEGUQIJLgNEce
	sIakyGMjWmO1EKHvw+xeHa1Ne6MO4Gw1FmbJhZOQ0karPYCOuE6+5P3mItjfIEZMlc3ZqpEGgVI
	EAXKSGmAk+ss1B82BQjwD5iyAheuE6112YUfhbSw56WratctIJDqqo45NlJC3MyYwz5EPoWr6Pj
	R4iXUSPOuS0OyEJQJe/sj1HhI+bhp03eLJC5vCNCMUegBAjdCWFMcNHB/0LGhRWEHhlakJkxNnz
	bx1VaUOPkyG6YrYmn8LBHysBPomROsqmu09hXLw==
X-Received: by 2002:a05:690e:438c:b0:67d:a6fc:6ba9 with SMTP id
 956f58d0204a3-67df4508943mr2085122d50.106.1795426312499; Mon, 23 Nov 2026
 01:31:52 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121034053.39878-1-prasanth.padarthi10@gmail.com>
 <20261121034053.39878-3-prasanth.padarthi10@gmail.com> <awQDxB-09pHSgfJ_@monoceros>
In-Reply-To: <awQDxB-09pHSgfJ_@monoceros>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Mon, 23 Nov 2026 15:01:41 +0530
X-Gm-Features: Aa3M54on3hjaWixdom-MZvFvoY_Ect6i0Ad8JpXIU33APeKTiBCUcj1JKRPJeMs
Message-ID: <CAMFFDGh=7CtLR5bOyzP0SuSXVaXY=5H2UajaFx6pcescqfYjYQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] nvmem: aspeed: Add read-only AST2600 OTP support
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, ryan_chen@aspeedtech.com, 
	billy_tsai@aspeedtech.com, neal_liu@aspeedtech.com, tan.siewert@9elements.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_013156_097190_7B27A8C7 
X-CRM114-Status: UNSURE (   9.75  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thanks, Uwe. I=E2=80=99ll drop the linux/mod_devicetable.h include in the n=
ext revision.

On Mon, Nov 23, 2026 at 2:45=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello,
>
> On Sat, Nov 21, 2026 at 09:10:53AM +0530, Prasanth Kumar Padarthi wrote:
> > +#include <linux/bitfield.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/nvmem-provider.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/unaligned.h>
>
> <linux/platform_device.h> already provides of_device_id without all the
> dependencies that are implied by using <linux/mod_devicetable.h>. So
> please drop the latter.
>
> Best regards
> Uwe

