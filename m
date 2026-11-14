Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C65F606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 02:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=353lvAlx;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AqRuCj/y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bJehl/EaRvv7fxLuacOZsocXgCWzK0RPTXvgb7IEb98=; b=353lvAlxsTo/QM
	o9duOQSO1BAvufsgiWXFnb9jPIvqqgjswp04eL/AJa6sdSPD9mK/KtUeylPNAvyiuT5f9WUOKACEj
	6oP1ushMbqhNonUrvzArUe80OoOT4kI2hp1FVYsHUN0pKQw0wObis86v8v1OGhhNrrFAen8jIgRwy
	y7X/8cKWkVxzOHYP1AkvySmhzryVh0rA9aT4jf4kf9DOXokIMk4osBkvY4vo5Z2fQbm3BsvA3P7EO
	+zc1xOY62cpgYmEqz9TUgiNxWCpDW8tx4Y+40e6AbgXz1cV94+2ljvYmvDXYcDFAcJuGFx6njHWdG
	fcrGGyqyrWJvZ5/Ys+Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS3aE-0000000F7JZ-3qkh;
	Sat, 14 Nov 2026 02:33:38 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS3aC-0000000F7If-1C1n
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 02:33:37 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-91c6ce60697so43553246d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 18:33:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794623615; cv=none;
        d=google.com; s=arc-20260327;
        b=NyOLPGViBpqVdoW+bxylSayC/duTO2TXMzCVtEGQ6ugSQeQMILI60zHN3XGJa6iqPb
         rzopMztJH0wddfHyDY35oKwuN2xYj5uiiUE52bnFxDn8vb/ozd23fwzIoWI5kNqHX/wI
         Wktw4VT/v7SVroSo0WlL+AoUp1qxwo0KXUtx+7L6S5Qy/UkFJYAASvndELdrUEWLjGF7
         0HAjuUKbccPVbE/fellnNZ+DtEqaE6iG27N+P88ZlyEKZ228K8U4cQL19AefzZsxIv6D
         FhQYhRsXqRy2ybzijn6jd4XmahmWhEInjlMndZpjj9XW4szX784QgrxzMaSZjSAyFnez
         X2OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bJehl/EaRvv7fxLuacOZsocXgCWzK0RPTXvgb7IEb98=;
        fh=ildmbCYvyQwuKH6KEfIIcxvkGDmppEYfBJzrgfn+M+I=;
        b=RlPG+l9nBFJjvJc4T+BHjEMmXSG9lTa0CfDOZArjc7R0xCNkXtm2UVtiFBRYHoKAs5
         2ml9DJ7PPk9oBLaBt77WSoLqQwEem+jCIG8RQ2HQR2hSkVRWPrbl+s2cD5kOGeTNKVKY
         Wc+oVslW4UAJ/WOjYz4/gLu+5ek8rFjccKPzpXnQDhUl4+AjlloAGP53jd9kxtfAdXlv
         hDRft4ZBTaN3klSjzrfnf9bOu2Z+W1a5ykMpkIvrO9YOSQxcAuVNs6H78KWrOkTbN0D8
         iD7y2rKfQHz/AdZhsiUWV+u/KZcMhxz9zRt0oKsw//++te07Rus17kCqA6P2jS41JVsv
         R5Pw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794623615; x=1795228415; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bJehl/EaRvv7fxLuacOZsocXgCWzK0RPTXvgb7IEb98=;
        b=AqRuCj/y0MeLKsnuMqSKAHaD4TRmfaOmqP40rd9NujkT3Xvlw4GQjzJJ1C4iJnUISh
         QmG8CwLWUn7SGclv1grJwSWT4I2XN57MSiml03VxjPkaFifDaSZrikZemUjXPG1Dm8BM
         8/Fh0fYRO8Th8YoSS7fBlciBzKmufSDDJXfQZkX8VWvGpIyG6NShD24Z+bPV/Hz/o6O1
         dhrW7h64ikvQuGVmnnY1w/MEiGWdH0kQTM9AOt+4DCTmknRI3tSipTuuB+3qBqcIRHXz
         vONK1bpCVQHOw7SJ+oa/KGqm2dYHgTBBQC021tBMTADgute0pHS2El1dg0ZL252r71yC
         j95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794623615; x=1795228415;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJehl/EaRvv7fxLuacOZsocXgCWzK0RPTXvgb7IEb98=;
        b=Jm8xHldZ0ug49exKQz9CLh879DTZlf9pbIAvsRzDlEHw29J2Ind5fp0PVWM5frhPT2
         g0+JpaNDjQRa1JxXKO9bYOgprVRc/nmEa/CoEUmaBm3Ho+c9cQsFMQ535zgHgpdM6gpq
         8SUdOlyooGbm5kR23tqjGQCjhDQSQJ/wGnwGexm9w06Hpeqt4E7e5+paJhCZsnU33bvT
         XI3bCnr00qqbba8dC97vvFWYv3dnHw0HQsry0Uol50qCE1IWwEFNAM7ahulf6sAgKeO8
         uw7DrObIRKTtLJ9GIZ55y6l/ppJqMLNKJ5l55A60k2VJ/WkOYBmQsKfFNeK6N67Eo1Uj
         6wuA==
X-Forwarded-Encrypted: i=1; AL+hErEWEolZOxBJfSRm/DhKs5+605ABRjoEkhFouj0hjebF+VIbDNmBVoPzxQw5QD1gNlzs0mPHkSLEgbbR3MFbfM3E@lists.infradead.org
X-Gm-Message-State: APuU4Z8MaMvscI7NDH/IT/d5WSJ7xNwIrVZnBavkUI4+IAFfqsl4vtjs
	3xcq/tk22XGOfOBdJ4VHZrg3I9y8DX8lhteO7ko13CFxufkuRUSgqA26mDYmNgf1zEw4cr7/WNO
	ETPfuNOMcH+3CphMUpgL4Yy90QrNPehs=
X-Gm-Gg: AYBFou31hm8t5u8HRZ/b3FuLh5uuTFaid8e56cOKPm+6Z7fULqnCuMevaOwcTjqejmB
	Eil45q9mxbdvBS/1jbWIXtjTzjsWd66Pt2+uEMfSmJMtTqNaqtjcegvsf02y6QmI29cnuZONvaa
	wY1Wo3p8QmTCOjVaF056RTAlUKq6OrSS+sXkCmNQhJMnfefGvGux3oHczU7rth09H/Lf4q1cxKN
	pyRM8FbRfXK5VXbZsA3ah/U5jrpOOb+rxdb6R5ijlyMTGu01pL88z1YdpdyHyfL64MCdP/ZHuiJ
	W/pW8cX9d0QahhsbYN2e+XsfbwUWmNjReOx0QTkSoJYjiAJS462WzcdPVc5mHcVWDQEvea2NthU
	HQgcef+QfWSKSlGQznqf6ozMkBUjJ/JOw3Udq
X-Received: by 2002:a05:6214:5907:b0:91e:938c:1615 with SMTP id
 6a1803df08f44-91f242070b7mr68774826d6.40.1794623614738; Fri, 13 Nov 2026
 18:33:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114015554.2187341-1-zxyan0222@gmail.com> <179462149962.2168702.2687296647559611353@kernel.org>
In-Reply-To: <179462149962.2168702.2687296647559611353@kernel.org>
From: zhu xin <zxyan0222@gmail.com>
Date: Sat, 14 Nov 2026 10:33:23 +0800
X-Gm-Features: AclHuK9PJFdnYQp60hzQr-aoL6oSJj2AKTDyP8sv_Y5ch8KGojZzj_LkveAYZWE
Message-ID: <CAP7veT+LavpYFKWuniXO8ddfXF7cYXNO-r_r=0Bj_pKVXJdawg@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: re-enable on-chip parity checkers for
 XGMAC ASP 0x2
To: netdev-bot+sinfo@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, horms@kernel.org, 
	0x1207@gmail.com, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_183336_333075_9269120F 
X-CRM114-Status: GOOD (  18.50  )
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

The issue was triggered on real hardware during safety-feature
validation of an XGMAC integration: FSM state parity error injection
did not raise the expected safety interrupt.

There is no kernel log to quote for the failure itself -- the defect
is a silently skipped register write.

On XGMAC 3.10 and 3.40 cores, with the patch applied the checkers
come up enabled on ASP 0x2 devices and the same FSM parity error
injection now raises the safety interrupt as expected.

On Sat, Nov 14, 2026 at 9:58=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

