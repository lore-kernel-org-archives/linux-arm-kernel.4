Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4FA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 19:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b64NFIQQ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aO2oW9Mm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FhExMibayfnhhZfuPps5vX6y0sziM39MHH7rzV1Ch6U=; b=b64NFIQQjZRdd8
	TSSJ1/gX/WAKKvKIYUkDP24ZTao1Htu2s5MV6nNtnj+bz/fWCyu0X8q4r+Ch5eBj+9cdQbHoMvilH
	AgdTe8pa3TwXOA+2yxJja6YjeSUtgLzurhVNO0snNphsmuCHfKLV+wN3jHaFoHe2YeV2FoL/vrUvu
	sH8FfPFF7uNBVJ8siIS6mzqhHRIMWWKVoITP2gIVBZTVwUiIri5EF0TaB3TQDjoB0oGxDLwXRcWXF
	J5IpmHhnVmd/dzhnv2t49e2hl4VgQKKQ/dylXPHTOjbjmNYOYW1bfLBKYdC71+OJb6H9wbTOLu9Ag
	NITidLkX2IzKvS+VTGqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDZE-00000007Skw-38fQ;
	Wed, 11 Nov 2026 19:01:08 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDZC-00000007Sj3-0vtP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 19:01:07 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-37071c0f42aso5952666eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 11:01:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794423664; cv=none;
        d=google.com; s=arc-20260327;
        b=Naz2epkvurcnBZjJ+UtuII7WXufr0StsWuIVE6ySMkf0ygHNPYUrRvsz58jsUKlJpG
         /CoYFomBKACO9fXcUiRk9Jp1HNvsYSZAkO86coW4Wls7pQk4eq7VxD1GW6BOgCogEayn
         AIhRoOwjJhcfI8KT0JA5bxhfjzEmUNOdLvezJZ+H2C32fwMc9cHk8LnQQ+cqtRvtigpx
         jepJ22dVMcmCLR5D0Xk3DJYogQQzwMk4eWRA0nWIHoJf9ci0+fp4hOX3YodBwEDO7Oyy
         gV9JDr5DhJvW6YOCM2h+KDDieIOdvx9SlPaPK9/Yn9cjfJ2Qv6f7Qd5ReBTe5ijnXHmP
         BcxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FhExMibayfnhhZfuPps5vX6y0sziM39MHH7rzV1Ch6U=;
        fh=ZoQYet5pyiPaLeT7pIj7q9VSlW+jwPorQAvG0pPmVXQ=;
        b=Zfh6HMlKM9ptMoIMURkN3XtvdrGmAxNNytc/Hr5g3i1PJ7soBO+dh5TtrQSIQXGlbe
         ooTcc8hqB1uU5BRADvw3LgepXQcdkFHZBUH+rG5g/KAxdxGj3P0ZfgChOC8LU4eCEZhp
         qBe9j5WFsIK71YtMuiguKOpn6pKn1eUalO9Dqgxd0IhyHXr2/QPhRCOWtkemOUfYMIgC
         cHaCKcaf2NVN1qrHkDDfiGMAO9S/vUykc7Fm7hiGsj3LusAzlMogOW4xSQEVJSAMBnbE
         u1eGyCHuB5VI6CpFQGmTkEYunOWEBYYpjUbou+gUVMfu/r6NCjpaXssxzEp+GAkClLeb
         x7qw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423664; x=1795028464; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FhExMibayfnhhZfuPps5vX6y0sziM39MHH7rzV1Ch6U=;
        b=aO2oW9Mmznjws7WqH17KKW6gt6s8+m9PtkSqBN4kHtK1JT0QQ4j/dS+zSwK6+5PGMp
         w1clWdVUqw19dkciKp+Nfp3cRA+6zLdZVSu+RMq+gixREoSxwrd1Qb+iRdCHoHHEAfYf
         HCKlr826EuW1Sy6p2LPHT3GK+v/Rxto963WSSthvAYEfHpM2xUBPgaRnIB6FjMaj+4uV
         1H2JVd8kDU6sm71WOWI68GO4p+oVhMmtt/Mnz8G9uucWROC0XxiZWS75cf+HKskiHtO0
         Fx7n+YoJud0QLasPEwFz/GHIKEIdlyXg4HTahsiS0BBF/2GC+EiiwtNChG6fFWhX5XdT
         W10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423664; x=1795028464;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FhExMibayfnhhZfuPps5vX6y0sziM39MHH7rzV1Ch6U=;
        b=rsA7lki5+xj3VC+cUPujAQaxagBKgvYvkTrEG+7Q/0nteWM6/9ZOYt4+9QSi3Yjhrd
         LgmPC7sZ6DGn1kel9yFN0MMyjsSNtvFCDCroJ8As96aH7i+hb8G5L7rtJIT14SRE3bJc
         XEy/tiwVA7v961C0ZfckkdBGuMdx9D7wnHlpGl0scnJwx75oAeZovA1T4q3oC+sZaQbL
         lZEfyhUvw9Qy7n9FTCFksTqEikxRyCZR7FQYJwiATEcjqwYSs8urKN3eNEWaUDkyL6/7
         4aQ+i7QD2hOGGHlgvbEXNYwmR4WlQQD2YP5QoOXclvd1guLpytj7zMbU6YYK++A4Xui9
         /T+A==
X-Forwarded-Encrypted: i=1; AL+hErF/J3sE8c9HwABq+nA0bsUrLudr6TGnKrVSl2uR9DMAvJ/ClK+s7/oYHEDEzGVaO1AjEaVX73vfaeN5L/U131bS@lists.infradead.org
X-Gm-Message-State: APuU4Z+nX8jNTPhUhcos8KjXClSVPI1KwtsroVJXbfOaTX01iukv4B1I
	bmwnpRSx1IIg1quJI1xv9S7s/aKUixy/bZJ6n5t1cGhqgq4gxktxryZn2OZQZk/rznxhsPcSAEz
	KS5qUlMGlUy6xB4VFrA2b1uJh8332qQA=
X-Gm-Gg: AYBFou3At3OEETmDBlARwhHMmTvtGxfNn6ct9Cwno+D00W5WlLBURxBHLJbXi4+Rfmu
	VZW5lOojW4tu1x0MtRNyOZZnzZ0dyofGppdzVDBm5cu+pAWjvyy1Y11sMMLblenf8Zga0TcReds
	Kkzjrw3ufssnHjlFJiPqA0S1bRDAAi2OPb46nGaDiZK+hp7ajENlTfuFyn6BNMy5KqKRb2vNIj1
	8TY7USPEnCe5gA6HhVBhsuRm5oooFsUU/JySAN97Lwj38/fw+9ET6ewRFjfsmrnO7eSsJvyYotU
	VDCgzjRoC5ImkD9CwTpWIA4Eo9mjAG2CJnnZ1KBs2FMrwb02Ccz3iHSG5sSsP292zUnc4r34Drw
	2AhWBsFgBFXST2dv02Y8aM5GdH+Boz4P0bPtWHHervxGmFHEXGsRUV+Dc6V9dY3Y07TFeHYUL7i
	WX1bDTqOa4sb8KyQ1w
X-Received: by 2002:a05:7300:aca6:b0:36a:15cb:30bf with SMTP id
 5a478bee46e88-3768579fd19mr5126531eec.13.1794423663932; Wed, 11 Nov 2026
 11:01:03 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106010611.1708587-1-lcy8047@gmail.com> <89544da0-7c18-4fe5-8005-131760a2b8b5@arm.com>
 <8a20b9a9-b10c-4b7f-8d42-2e8c60edd943@app.fastmail.com>
In-Reply-To: <8a20b9a9-b10c-4b7f-8d42-2e8c60edd943@app.fastmail.com>
From: Changyul Lee <lcy8047@gmail.com>
Date: Wed, 11 Nov 2026 14:00:52 -0500
X-Gm-Features: AclHuK-2wDvDd_YZaNx0NfT3zLBUdDhEM6_NJ0-1AP9VmFhU-7GE9k2k4Tj3_HE
Message-ID: <CAKefsHt+LO=1f_AvOmr1hpG1LreUXby_qmjhgBed9FESxgnPJw@mail.gmail.com>
Subject: Re: [PATCH] serial: mps2-uart: Remove the ports_idr entry when probe fails
To: Arnd Bergmann <arnd@kernel.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_110106_267222_AFDBB2E9 
X-CRM114-Status: GOOD (  27.77  )
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for the advice, Arnd. I will keep that in mind.

Changyul

2026=EB=85=84 11=EC=9B=94 11=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 11:30,=
 Arnd Bergmann <arnd@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Wed, Nov 11, 2026, at 15:17, Vladimir Murzin wrote:
> > On 11/6/26 01:06, Changyul Lee wrote:
> >
> > Before getting into the review, I'd like to clarify a few things:
> >
> > - This driver is only used on a NOMMU platform, where any code
> >   can write to any memory location, so the security impact of
> >   this issue is likely minimal
> >
> > - The only platform that uses this driver is deprecated and
> >   scheduled for removal [1], with the driver to be removed
> >   afterwards
> >
> > @Arnd, could you please advise on how to proceed? Should we
> > review the patch, leave things as they are, or take a different
> > approach?
> >
> > [1]
> > https://lore.kernel.org/linux-arm-kernel/20260908152808.3928630-12-arnd=
@kernel.org/
>
> I don't think it's super important, either applying as-is
> or ignoring seems fine, just don't spend too much time
> on a review.
>
> For some of the platforms I'm planning to remove it would
> be nice to backport fixesto the LTS kernels in case there
> are some users after all.
>
> Chanyul, it looks like you've done a thorough job testing this
> patch, and you probably have similar work for other drivers
> coming. I would suggest you try to prioritize the drivers that
> are likely to be in use somewhere.
>
> I have a branch for removing a lot of drivers including this
> one, maybe check your other patches to see which ones are
> obsolete.
>
>       Arnd
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/l=
og/?h=3Dboard-remove-7.4

