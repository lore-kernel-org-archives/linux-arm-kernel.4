Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABC0606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 07:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qBhfhbJT;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C/JXJD1m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:References:In-Reply-To:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uT5yC1vz0hTCCQYbRPqrM1RAS3M39jnWDO+MUUDgNVs=; b=qBhfhbJT18y/yLyN3FZ4gopns0
	hSJBbmOlcXyexfEHfAxg8lto+cwoZxSJ2DM5XnHuA44eBkq07v9Iz1q8YurrrOl5ZTKCQzzCquDoM
	LHw0X5GnKlEQX4BJ5on+7V8CO2TNUL+MpYpaqFtYtvATmhd8wIOPY8DzyhODAF+2Rrd6Qe8vhBIKD
	LY3iMg6yeoZWKJAbYw1gKjCqZEyrHf3wNqUyKiTF8FguyZnt4goAxId7gNm5eYwqg8224H6F4gOaM
	aTZK8L+NpwOYAzODtBNfWBOmZ0CXLBGHQ1gEnlYigOhJlYPpcVxy77ZaG6UD/Wa0OCiM0m5UjxYVe
	t24zV4Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJVk-0000000EHnE-2EsE;
	Fri, 20 Nov 2026 07:58:20 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJVh-0000000EHm4-2FZH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 07:58:19 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-67da564d9f2so1082717d50.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 23:58:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795161494; cv=none;
        d=google.com; s=arc-20260327;
        b=muxLuMsjTU29kcuL8AZppq8KWi0x/wv+oSBSn93kUI6otW/8Vi5pQzF9YaQOg0gItW
         ZFpvzzgq+dR2lxZwZ0IVhgp9CFdG5dsBdsg/Wka/aUCrg2iVWdJDNDXiYuuYDCPZQWxT
         tP4iID606BkwSy0w+9lLA/8p4NIonONxD8a/YwdyFStmAt01kB8gnVPMG06UB/Zop3GJ
         uR1y2XbJwSX9WzT0cGiYcj/zHLYdk4nRq/QCDAu9eAm8uIKRtN+A+Hwb+CnMpUBbv3lx
         RR42unZ0VyeaUWMOC28G8FoneJIaiKTebvfIFlsthkvrim/bovAPzAlV1OBTN0OB3bdh
         NJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:references:in-reply-to
         :dkim-signature;
        bh=uT5yC1vz0hTCCQYbRPqrM1RAS3M39jnWDO+MUUDgNVs=;
        fh=ULCPbfLAloT3qom1uMz6mB3J+FlPf0C40ae7U/+GM9Q=;
        b=opmSmxAcQiob1y28dKpmbn6eytqLEfbJrxCQuvQGgR78QIJ+cxUSv1wfpX0n12r1OP
         KR55S/dCf/hkjaI54j85jYtu3MVjpgHy3LL/3YeXM60awLC1ae/go/OkvbNlq2OraMH0
         tn0u3/VGanc6s0Vd3OU8QJGRhfN6rCxWY88FMBxTySw9pfV8sB+03LhHT0rUHYoEVQWH
         galtmd40CcK1BbA5WjlRG0H4K+21dINVdI243trS6VrAOH9+cLzWB5Y2YmF7Y6t7Nsip
         zrkQ4+DxF8il4tg6QLI1fVJ6kQ6TlW41PDbsQJv/gFcLmlbC5d7ptX1x7WBJ94U0lh6q
         v0ZQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795161494; x=1795766294; darn=lists.infradead.org;
        h=content-type:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uT5yC1vz0hTCCQYbRPqrM1RAS3M39jnWDO+MUUDgNVs=;
        b=C/JXJD1m758wjScqB5YZ6PD1Pk1wuNAGxGR517G1xbQbapsYhAY+3x43SLfMe2yl7L
         fJdkggWqyCp8ARSdKtLHadXNTzj7AbwNN05yn8FYhHCr83USQfYWJiAhZahh2RDdxeIq
         zFAN1xExeGRukxxCwaEd9F1HOEWF//J8eBvUjCh1WN8qXLdJWkaX9+ixEUMAlpf4KOQU
         LvyigK/vEgioupYGvMUVkOvy2hEufElIhoBUSeIgAylntX6PWH7HCDlRQRtVPv3S7LZw
         f9Z0cBLZk2PsN89BjyKYqy2JRlHjMU0JBvIRFSb8l6u5zWM0j5bkfmLGJ+fuiV3QZ5/J
         sdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795161494; x=1795766294;
        h=content-type:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uT5yC1vz0hTCCQYbRPqrM1RAS3M39jnWDO+MUUDgNVs=;
        b=FaKvCvoSHfLjqXYSL7jl/kGdSUEIV3R9o+cSVrSUovNFouasOac4NafwhDDPz2NqC2
         MT6D4LaHgq+LQsVPSfKcJmAwgTqP0W8Z7E1r1OAKP2HChNC1tPveffyRj3OmNzNw+PR3
         buAOtNjm3GhnEq0GUdgwzkbGtIVg5cer1OBIQDc144Y6oS9hAoLvqhjDHfGHjYsu8KnV
         zYx+Q73ZbanQFg6N9fX2JU+Rkxqyu3cL3QdliJRbSnOjfHL/zEvC7rWlPn4vUwIozXnD
         dVxoZoSkHOEABNUekTL9m1ZV3sg3ewthNctwz7mYu/rQrKQ5HGhDKiza6Ns8tw5qHAPc
         7UCg==
X-Forwarded-Encrypted: i=1; AL+hErHdSHF/eMUsZ+6KbpbkNcqaVEQWKxKnyANYTUinTrxhIgEAYNrSyHf+Z3yPQjnPYIK+FqafMpf0TVyYKVFGgU1C@lists.infradead.org
X-Gm-Message-State: APuU4Z/2CeTI/RXRsKXlHZAeZKbCNrO5gizVahkjz0nLhw37MgVMY8qA
	fsSGklshSmMDBZw6SXl2c4ds+jrzliUssUfeSIP18fxniN0lTS+rXkULds/jhIk4VdWdIWjPFBb
	qVkwmjNDjmdyzn2Zn+ccYZo5LIXgcGU8=
X-Gm-Gg: AZFdTZcKb05DBn6yEyGIkLCh+QGtlSuMq/a/ENuT1AAtsN9r6PcYOLSsfLZ0D4tl5UO
	ZXlDn1avpmZiacNuksNmSnOiW2n0jhQCo3GWUsVMu0R03QUt67dC7YQPyR4ifXTz296A+IFlQLV
	VMEYJBXSX3isdB42RmgkOeIPSN8unO5imRJgk9abXz/7uj70gqWttHV2VXIs7mrhV+GToaQrelZ
	zOzKO7+iEkRi82DLezEp5faOAA8jajX9PoigLEbXa2yMYYxGK68GDMAejd7snxAJ+6LLzlxN4wK
	0whkPmjAX7dEk33+TC3RMamtNmbeCHgt5slexVYWfl2YfGiSkl+yXMuvdLEyldEsTMZ7S8c46sg
	QAd6T0EULal2jfM2sUV5oJ9WjkvdJ57BnOAFJx4mBJtRht20vW3FbvTNoZZLl6A5Q4rL+1ldNSH
	FMX7Hk/RGSoGYwk9K5AZJmIFM8OX+vOvgO1TWLvsNiEhuXLRRioQg=
X-Received: by 2002:a05:690e:b81:b0:67b:ed25:6981 with SMTP id
 956f58d0204a3-67df446b547mr1140071d50.77.1795161493596; Thu, 19 Nov 2026
 23:58:13 -0800 (PST)
Received: from 1087654160852 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Nov 2026 01:58:12 -0600
In-Reply-To: <2026112041-suffrage-bonanza-e079@gregkh>
References: <20261112-bcm2835-audio-unused-decl-v1-1-3b63a24b033b@gmail.com> <2026112041-suffrage-bonanza-e079@gregkh>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Yusuke Hayashi <yusuke8h@gmail.com>
Date: Fri, 20 Nov 2026 01:58:12 -0600
X-Gm-Features: Aa3M54rDBssWS8x-mWGeSyXCm49DwKaFGXNNyDKNZuSemUCxLCe4Jn6SB8XT-cU
Message-ID: <CAB59oQ92ghkX-GFoZPU8bVSe+DPEpfDrjs2aO08AAG0Ja8y0Sg@mail.gmail.com>
Subject: Re: [PATCH] staging: bcm2835-audio: remove unused bcm2835_audio_retrieve_buffers()
 declaration
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, yusuke8h@gmail.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-staging@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_235817_583269_32D9F920 
X-CRM114-Status: UNSURE (   6.33  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 08:21:51AM +0100, Greg Kroah-Hartman wrote:
> Please read: https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh

Thank you for pointing me to this policy. I have read and understood it.
I will drop this patch and make sure not to use LLMs for drivers/staging/
cleanups going forward.

Best regards,
Yusuke

