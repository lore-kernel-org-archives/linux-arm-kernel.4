Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DD2606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bKiaLCK7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xqpm/07f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZXMGETsC9In5OHuZKA5+0j1fdxY6lC4P1HFXTVDB2us=; b=bKiaLCK7Nektxl
	7wM9GlmttVrJcXitI7Cbh7CsZQ7S+QIA/Z3sBlB0vyL4uoKNc1w0PqhuKGgEojzecZFhB07qfTnEX
	Qp0V03VEEyQWvkSkmfzhdGBdkMSi7Nc63gDwYiI579e3ecGxCQG7CH6Cl9A2YTBHm0ts4dpgyJDKE
	sj6iCXww3m+Ix6lI1nnE/UHbEj8JwsAKIAg/ziwrOEyR8J4Lh93yxRWFUPM7cakIYwr5DX37eoC6X
	iqh1WM+QkJ3sV0Hx0cod3AZkMX4S9cstvdBexPEu7Vuk7QC4V7pB/UGYj4dPGoqKW65XMOmFIY3gz
	BMu6FWVJpTN/lISOgsKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZN6-00000004cBz-0j3B;
	Mon, 23 Nov 2026 19:06:36 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZMx-00000004cAc-3npK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:06:34 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-8b0dba37a7fso29370837b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:06:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795460782; cv=none;
        d=google.com; s=arc-20260327;
        b=M/e1RTk4KCo7TBGEFO5NJRFUlE/ALoQSYbU0UxWlGEHDEd7a7t/IpUeiqxl23HWLJ2
         o7Jckb7AUnBEWT22f5ycrKY/vMJthSNuHT5eyHSlE8Eu4TsoiB2C609JguXjyd61E3tW
         7kQPOWTyUi/78kL+fK+I2IIxYZevdx4dqqjtR/vx4zTGdERBnfdBSckLb8rl4/bS5p2U
         dGiHAEwaM6oFHTXlsAImliLfyq/VvyRoqAsLTaJDV95p8LOM3AwGHNdQOCzQFcWfdChZ
         ffx5On+MbvNtTRSoeORvXBUoGSk0ZwjG1hw2eRhP7wWWi4fXiuLi1dQW2v47oOS9wRML
         PjkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZXMGETsC9In5OHuZKA5+0j1fdxY6lC4P1HFXTVDB2us=;
        fh=fsetPEY2PyzAPpvkrqDIsojLwDgy1/G8RxjBtQe5nC4=;
        b=rgHBccrN3fx7bYSodGx0PYvXumvGdwPU6pc7B65D6110XUEcehZG8mJBMjQXupltc3
         fjYsdUda2CpqbwMOR7rxboTip6WWIOnAO+X+hL6VIezk7iUFgNg1iNYrjkwrP+o9mW1w
         YXkFFomx6CDIAZCXxLCPz1AcJL+2BtHzqXgqWpogXbzQZBmLePq9f18BxFpeVkz8gP8s
         D4kGzIiOU0gvXa+G6Bernq9ViRCBeokfXDrJvnjS0Xgx5GdYeG+NNJGnfPOo4BoxB8lg
         xUedq96NfT/9YAYNNfTLE8crh8w3SOsX+cMRiJeqL1pP8YKwyF3teN+xH1AZdI/Gwpwq
         xgAw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795460782; x=1796065582; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZXMGETsC9In5OHuZKA5+0j1fdxY6lC4P1HFXTVDB2us=;
        b=xqpm/07foYkQK0S7jIiMh+VpWTQ1hCqw73k2SBrh9FbgDD/I9AloC++FS3J2guK4HT
         A6nL8PGbGtlJvWx6J/mZ7MWswzNihtvQcSNGoL7HKjMNO+Rd7286DMPcFzhiu/a38Slv
         ZblcPkv1xba5gMyMV1OAvi/JN8844nuImpnYU3nM0C7SMZhXTQs63NpN2MCG8VtpRdIF
         beZRFgWknPUmzIWiQQHxNQ6FNUfL5AUZ8+yFOpzC8MM677Y4YU9VT0nXmGvM7cSnvPSh
         CSk7l+T/zdjw/eLbF1N2ylduCsO9zjejWCoUGuIDAozOPW0yPeq4yjPlhbDdrVpctfS6
         8/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460782; x=1796065582;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZXMGETsC9In5OHuZKA5+0j1fdxY6lC4P1HFXTVDB2us=;
        b=fzWZHN7i4XVi/QVLy4TMB9iLWk6zrpLYbAsF/Mnaa1MWXICYUYPzyqdaJwiYh+ZnEG
         CpzgWjCXa9PBSw5FTSl/NQGi7DloXOkrRWkZarIurBonvSDsM9XU78Lf+5uw8s8QmiNz
         KtAfUVSYG6gP2DwpBmpWPPUNLK20QjZDU6WQIgVxtVjFx5/7TMf9KNMcFebDZ74InES1
         yEnPtYq+4HAfm+3UTfz421bfo5jy3HPCHjcxg9lavx2YsdpGWhyCca7Qwx0iypmsoew4
         rKAEzuXI5Uu7mTs0btFilhFC7MqdaA18PfPy6XBj1BC4SzRpv7r4qRRrAcxrYTrbiWzD
         WvzA==
X-Forwarded-Encrypted: i=1; AL+hErHMR5b+qbnS4xAYdyi1dQQhyH1nEeq0LdlDaMtnsjS3W//Kv9JYqsJhVI94Zog2ZpIexekY9GEbrKrGq/eOnYRB@lists.infradead.org
X-Gm-Message-State: APuU4Z941U6UJViR7KA78xeVwR1fbexTmC8nXnqljZzWO/BfcUXBNPnc
	BgNwOxqQqi/P+pOjizHqJT1fjl3Nsg5sp9/M3Drft4tVbMigxahV3Rx+k7xvGcFu30Oax7V4S4T
	LlMijGqUo2M8DRQ2B6TO5WpwAXHO4u38=
X-Gm-Gg: AZFdTZfv2VWZdg04hrJtUxguJGNb8JU1+H22rDu1BpLzIpsuFCwQVXyBOdn0y5RNkSu
	j0f5PHRCI+nHuLIDuXkQ8rLRCMVeuiFLFXLgsU4wXqogSe+NIEz0xpjxEngLe4C6R9l7sKYtbA1
	EMMqg9n/ZpJfYUTpNUcN5jKHsU71c5Se77sh0J8NbqVV/6dGlxc+ICEZ+IOlK8PlfZs8TUMmaTF
	wQJuIfWim67tQC8e/QbIPb91g9309OmvrYxBhocShyxdG+DLzSu0Y9Z3zxz4EqeuTTjqVj8T1Yc
	7H52AC7/sxi23LY8GDx3wAXGlklwsb2fp2zMO9FrnE9VtpNHHy5QmBYiBcowLODUYQxIoA8M/lV
	n6pe4zTa3zqbQtZEoYXdu33XcsBAD9sZTt+C/f0y72fz0e3DPo1my9TySANKN
X-Received: by 2002:a05:690e:168e:b0:67b:f3b8:aef2 with SMTP id
 956f58d0204a3-67df4425a32mr4425732d50.25.1795460781865; Mon, 23 Nov 2026
 11:06:21 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123085351.3415122-2-thi.zirnstein@gmail.com> <20261123085351.3415122-4-thi.zirnstein@gmail.com>
In-Reply-To: <20261123085351.3415122-4-thi.zirnstein@gmail.com>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Tue, 24 Nov 2026 00:36:10 +0530
X-Gm-Features: Aa3M54q7qggItqO2nWN8m27kiDXSWPUp3jrrfb_cbuCo6wTR6DNactR6aMlLEKg
Message-ID: <CAKfKVtFDez0kDJp0Kx4WbJ4BwqV8-0hb6eeRNjQ8YDFm917_UA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] i2c: i2c-xiic: fix waiting/clearing while atomic
To: Thilo Zirnstein <thi.zirnstein@gmail.com>
Cc: michal.simek@amd.com, andi.shyti@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_110628_039815_E0606826 
X-CRM114-Status: UNSURE (   7.88  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 2:25=E2=80=AFPM Thilo Zirnstein <thi.zirnstein@gmai=
l.com> wrote:
>
> Use non jiffies based waiting functions,
> if in atomic context.
>
> Suggested-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Thilo Zirnstein <thi.zirnstein@gmail.com>
> ---
Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

