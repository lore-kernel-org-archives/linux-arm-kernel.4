Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928BD606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F2RxVbDE;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=o7jtht3M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kKBMVrrjJxWb4uJFICeq1Z/Q6PHnOrbC3VFk2e1elCU=; b=F2RxVbDE+LyeTOrgxtk/BB/gq4
	8cnHoCVaz7PG4HSgNT9FHUPUOJE+Li1t+weH86Eyc6i8E/DGQ5Awfkvd1numxGKEm3Z9fVoBG5e4X
	4HCpyn4PYmjaH648PCLKnwY4E38kPYbgXY7zSAeIbZtFBxS3Xu68VvRinpyeUX2LQA8wsKBReZcMR
	DFWBJDQN8yjKSWqg95P1lYq2hJqkww/cInEmcaqRKOhUCjbqUYTX0zA2VKO4dL+Mq6nP86i6fQXNb
	zO4AXZkZIiYxWmxWfyL5KXtnX7GWWvJ6mch2oIwJDzEAqtYMod2SlZXrKA3ZkZF8v6rfjTGN6b7aT
	j0bKJGIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqwA-0000000Cowq-2bMx;
	Fri, 13 Nov 2026 13:03:26 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqw7-0000000Coup-2gvM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 13:03:24 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6b79f5115c0so2047582a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 05:03:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794575002; cv=none;
        d=google.com; s=arc-20260327;
        b=PeSWXUDcfi+PVms8l2RPJtWcOXgM86UGRHBOOIC3Q/u3d2Arc4n7zO47m96oOp8vLN
         u/WlWHiJwFpGYvW3JbeBWZ8ebtVq3yDpnlw9eoh2X5HDUKc4os2462PJ1nYysok9RYja
         3xoaZ0sZpZ6zjcWMO5R9gfDgGyqdyhgmB8gAM4kps/blUJEaYUqPl1lKHOT0NECCCn8n
         jK2gRKaAU0GAvICE1lwyYhXjYgg5FafM0P5YUGwngJn17Q25Bd+tS7aEQGSPFhfb9s9N
         fpJ3b/kLs2thWDT8jrRjNtSP2s3VD7Bt9AqAuyV363h+gbhbP7PKseT11vE+HD/NFOxV
         EYkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kKBMVrrjJxWb4uJFICeq1Z/Q6PHnOrbC3VFk2e1elCU=;
        fh=eilH9X7LGhhFknpiXydhkl8wOXyeKGL1ijJQoMngWWc=;
        b=WJ4Cm0cMXqm7HDV18Nlv0E37Qyz4FvXhHtNj5ttrL33ig53A4yG1Ep9AMHzt0o1HHY
         uHQzqlPAtVNlnwDRnZSKoG12ju/+qRtkXPDEzKM5pMmIfgKWe1MXcn5jw/+v6hQEKtI4
         RcLPnJ84Of0jQceog0Mis+N9AjKHQInj0WbEByiNrATthBPbkjdns7Bzj00wyAA2WODm
         PMmwIs8kgJoLSD6zKho6x8N78whEdZsUkqZC6PbpLkOVgy3n5uJ8UXUXybgB0ORxWuDU
         TLA++rkEEhDpFZSDraDfWGVPb2Nd8EGhvZ3bsDl3zgxowJ6vH2FYqDQCu4Eus5d7yPai
         EErw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794575002; x=1795179802; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kKBMVrrjJxWb4uJFICeq1Z/Q6PHnOrbC3VFk2e1elCU=;
        b=o7jtht3MUEbZ8d6jacHIMSfBQiN6EfxJKFUgxef9XqzeVE0Jr3/V5q7gJbFewMDzeT
         ghJ13Kjf8oV157JEr/GVJBDmzXQT3bJLjV5JO1thIXe54GqO1AHHaXJB7n72quhVnid2
         tUgBfz3ZynCoC+Qzf5T2PdS4k1xIrLtv09jMmtRQ69viaLO4W+pJCwOByUBKgs++q8+N
         hJ1KqzOZBK0G63Dh8uuv3kCk8LfRzeCUBMkTQVqmN/FruHkPbXWSNdQhi7r+vaYVGM9L
         XubAgUjXEk8DUp0Bkvdh4QSYRGDCPDfR14f9p7F6RVRVhReiX4iqrdQn0ZQWMDFgMwhL
         zEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575002; x=1795179802;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kKBMVrrjJxWb4uJFICeq1Z/Q6PHnOrbC3VFk2e1elCU=;
        b=biNlHTb2mGIAEJTI18cOXZl5frz08FnKCH34ACGhTfZOtwkuaFWyYcIZwCQFe47YQg
         bpmWLXLN40dmvCw8dQTvw0KeBRlbFpNKr6V5Yj1gWrrYZtvJrOEzcUf5gfEhozWaBZ4H
         wBM0igfuIAj4XvF5xXHdDl0nMYJf/xCoEBJg9W6j/Hddb4ztbUwrlZVD4KIuXVUPWt7z
         NWXzWE89rv78MZOEeXnG2YerNQMe1xrblcu8996v++NwIMdK/bN1E8RhwfqHfAfYciSo
         uNnPRd2ZqHY084X+fkYjS6ap2S33VbloSMVoeQpPse/B0L5MjfIE24Mt9Qc0G7jE7KUl
         GsRQ==
X-Forwarded-Encrypted: i=1; AL+hErHrx1XvPyQ64vVdHXblNAq6O0vOLNkUvkAihHuNnd+Le7aQYfiEG+suajyE3vtg24KJzwzbX4p1gQhbXWB7WLw2@lists.infradead.org
X-Gm-Message-State: APuU4Z9svpI79n3XYGsoFgJoAr65jSxjp1p8nkb5MVVghT5a7DNInQ5H
	aqS3A6OlfOErkWS9J7nT0okfnpvFZj0gaDSjlG99TYmQfIx7otdRNmoYeqKvJn8WuwSBRG1W/A9
	FRQKu0ILEHXfWWbEaaOQvp/h7XVcN0ElTxDgieaiJpBWx2TMyKN0k
X-Gm-Gg: AYBFou3FzxziNp4/niNaNk39n6e325VWZXcmTlFyDKQ/5gjLNysSbe469FBiaUXs8zk
	08UvY1wmz/ZoZIdiMnZ+ewSJePxo88gRUkwYdBT3vJrzqLPIly2Ec71j5PKN8uKd9rsOFDEyPC6
	44OT0HOxqOLgGHR9HK+pj79bquAiMWuykrJX6kduZ55vDFlR0/xw2aFQLBci5ZSXtWpTOofU+it
	lYAgd62URnFDZ2RYWiDp9Ds+RasEzn0+Tq8IpthpTMF4sXrRi1wo76+h8TrAlTy0U/yM7qNwhEG
	L/Y8StWy53Dhp3DswDewapQusaDQbxrazayacYOUtFP9zO9/lpMRo03dkMTyVGMW4EtX/MF6RpY
	APmGvjlYgRwFjr1HF3duurWnVeK/fisP2h2xAAeVxTMeuZrQR9IjzCwHqC9Gs+DK6AY1KxLAi/f
	0Qjsg0ftX695D4ZVA=
X-Received: by 2002:a05:6402:c517:10b0:6b3:d0e9:2e87 with SMTP id
 4fb4d7f45d1cf-6b7c08b0a8cmr1544223a12.5.1794575001558; Fri, 13 Nov 2026
 05:03:21 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CGME20261113104858epcas5p47fb0f4e46302dfe01070f4cd298870ca@epcas5p4.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-11-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-11-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 13:03:10 +0000
X-Gm-Features: AclHuK8TI6TajdXfbmO4ZfXjIUyzkcLZWaP_zfTUGkQ09RFX-UNUsATe86j4dT8
Message-ID: <CADrjBPpUGoWPfmS1Ne6=KnXoGM_vc_X3510xF2zwmqKkGzms3Q@mail.gmail.com>
Subject: Re: [PATCH v3 10/14 RESEND] clk: samsung: exynos8855: add block usb
 clock support
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_050323_699738_0DF3321E 
X-CRM114-Status: UNSURE (   7.75  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Raghav,

On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Register compatible and cmu_info data to support clocks.
> CMU_USB, this provides clocks for USB
>
> Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Same comments apply here as for the other CMUs in my previous email.

Peter

