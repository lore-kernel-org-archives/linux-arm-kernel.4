Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C0C606A895
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 23:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nMbmTC9x;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=zpGsydUi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vKFbfdMvXjvxtZz44CJBuXtclzOrS0keJtHN0viUnbU=; b=nMbmTC9xyCFqFO
	Zheg48SZDDyL7RMaudlDOZuFSuUTE9DI4vw2rnPNgii7x0TAAS/uIx9XFrcqC3PDctBXRfpxNzcxa
	3DR9Gq+oI6CzGQ+4TQfdq1BAaKVeEs5guIGvQ8V/x2yVWwQnZ2mYSW2/7WXId6MJrj3rDXCwgsd1O
	X5CeQ7VkFLqHlkjM/1BJr2NWbBCyXEyBUmNdnYmLBE8wxrp+yPqbb+iDSGQYfHQ7RnyRyJ6DFp/sT
	uQW+32J8bIR1Pc9XDP0UJLNpm4Wf6M8FulUULJ9wwzBREiTOYFaIzeKN32JAuWJZxVJjYDjCfGCh+
	/fYfkZZZCUMIg9K7Pqgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdn7-0000000BDoT-3VXG;
	Thu, 12 Nov 2026 23:01:13 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRdn5-0000000BDnb-1Vdi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 23:01:12 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-67c2c2ac1c3so424408d50.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 15:01:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794524470; cv=none;
        d=google.com; s=arc-20260327;
        b=VzBSvfqbKkHHdE4SFcGHa2ZU4zvj1CDdkuJsSP0MT3Cn63N6yXf1MDDec5+Sz68UFm
         prbARUNve+rIGGLkt8EGS7ZFR4fFjLFKFpfeNARNahc+pLQZa2t29enrhwfKyuc1qYWj
         hDmi6RjtQfHipridp3EHU4FTKwxAI8bKgX0jGMV7SLzLNXbsfGsV7VJVi0tCJtXgtzug
         r4rc8QVlZN47qOUZFWyS5f5/HLJG6oQI268vzDlHtU+Oc/yCAoS4/duONr99V50pdbQK
         uisVC/h9cs1SotIR6+LDh4RsbzyY9gcXVIkPcIS8OAo9gdk6xrsuywtS9moh93PW7g8h
         61gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vKFbfdMvXjvxtZz44CJBuXtclzOrS0keJtHN0viUnbU=;
        fh=DY8mllOLRplqCYzlHT3/DrJKav3OcJAghYroFSh/jUc=;
        b=Jd8QKmEASiDED94XwJz0qZIhlXKuNy8Sr31LYhHZU+U+pvChw/5y5uzoTQCnEeHw4+
         iUP195y7rOvP1SaB2J5ga95bAWEXVfLFEr8MjZV69+mw1v2CrrvPw4vu/5Ph9tgjnIaz
         mpLT+0EOvUc+F4pCvQHlU2tfKqWbAAxNMkje4c9J2Mo78hi+g3cxItyMQJGSksNx62Zu
         PmokLK8ugfKlTjzB+5JwJtaqN5lrLZpRiQmSjI1j9weDruAbU0f4KQIqsiZ/rPQz0M/g
         2+SEdA21OSrqtlIg6JjnQapEqqTvoeoGR07Zm8poyTyfqyTaKvnzflCchGpHK/RSbhM3
         aeIQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794524470; x=1795129270; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vKFbfdMvXjvxtZz44CJBuXtclzOrS0keJtHN0viUnbU=;
        b=zpGsydUiyNvGPp0Ivl1PTaI5ElraHPqAt9/Ol4moidyK5yvTzJJHZLAYMgRIFTDKKB
         7+Qdukq9V/3xJ1oWcFFfO2iNMdDcPFFYzvEbajPdNP5y+QCNUcZfTydaW62x6p3zUfB3
         AtTspqKQPg77P3RE336LPF7gFJ4RLXzZjKQrawPz/7HgbkKEbtD+5AtwvTe355JrkxZp
         r+pUTlICainQtqd3s3afZROhHYz6Yx3uUb69meSJI8GJNPrE3z82iNmjqi1yIelsXhuR
         i+03PxuAX5oRYShTjn3EB+D3do48NXwSd/b2nsLVFbkQTqql+7noR/Lt2qhw+p8A5uPD
         cLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524470; x=1795129270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vKFbfdMvXjvxtZz44CJBuXtclzOrS0keJtHN0viUnbU=;
        b=F8CWpAKPx4ZkVrwhNoO5M7E4vNqR1zynRNqlfP+ftcRLwjZT0hv28g+OC2wOYCdvC9
         ocaqUhqw+3vS2WPZXHAwHk6NH1nSHTjbQSerdoI/x/mT229/IITD38KJ2iNsbiBlu4Wz
         3+ccn31pQz6DUSrwKCBK0YZ863F0FIRGFrRxJ0TGLcP0pq94QpBFXlTPIuHHLQhYs5MT
         4FyfhgH3JPSJUex33dA2vAD1fbPpcm0VRLFOji4PnCpvZ8QmF1VlL/jR31FZmO0GThgJ
         VpT/XauvhAh9Vqv4ZZGhS+FkVyH3S6PICbFfBFZZvvkcQmA5T7r3irHGqqvGSFybMxoy
         ugjQ==
X-Forwarded-Encrypted: i=1; AL+hErFuNQfzWx126PsprfLACj+McMsLcgu/OsKQChbZ7UxnIyntMFTa98WzwfC4bIx2LZXTf2wgTFPVmsHXeHbqeunp@lists.infradead.org
X-Gm-Message-State: APuU4Z9l9Y8n1px8fwIXzZqTbXEzXs9KzJE5wR+F7mOSPsxytTKbjZHr
	IYOjfdkCxLi2sCe0KP8l02PrgE2nGQKCZz5BJ04r5IO+FZQSQ+aGEYb5/Wm0ShOLHIZEiFmIvzM
	yX8U5q/5eR1iZgI4v5wTZcyG5yMS11/8=
X-Gm-Gg: AYBFou3CeoPozzCUlhzkmTcL4smMw55h7KIJLubkEQCSzzq4bbxHeHbkFxQyqc6Rvyc
	lH4DzGK8sI/rmEAl+toYsvamUpSZanYxpZyCuTvD6dTDMx4+sS/6D+vDfFdGY4MOFlU4uudN+NW
	EpvIIcg5RION8auIX4lTm4f16oUgaGORRBzVAih8j82jqxFoq6Az4lKofxQ5gBq6bMxJ07KGmAN
	QsbHi8mRAkMDgHcjSXMrw5GNyRnY8orj9FwmXuapk0cnEgc5o6sIWFNjOgH4EI2Alpai+S4tzOB
	VdKimy6dC+FTbnk2fbky2el5L5OlyQLj1B6AwN/0FjrosfYlb8varWjfMGGye8KcwAfSpPsEVyq
	lscCTtJsexrpG/Oowk5U7hHebVKA/5BxnsT3JP4nZdDN/ZSK8+Dl0WNC4nDWQJpQM2vTcKkM=
X-Received: by 2002:a05:690e:1182:b0:67c:1eb5:48d0 with SMTP id
 956f58d0204a3-67d895a730emr587688d50.21.1794524470098; Thu, 12 Nov 2026
 15:01:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
 <20261111-gx-formatter-use-spinlock-v2-2-763241aeca52@baylibre.com>
In-Reply-To: <20261111-gx-formatter-use-spinlock-v2-2-763241aeca52@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 13 Nov 2026 00:00:59 +0100
X-Gm-Features: AclHuK_m4BWciMvBzZXogG5H22e1sIVJEt1HWBlLSLAAMEV4Eu9tlsQViR8cFLo
Message-ID: <CAFBinCB7Okxzq0cjAdpynmJb-oOuiYkGaf6w--091_nU0OJFKQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: meson: gx-formatter: add lockdep_assert_held check
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_150111_400132_5EEB9D8A 
X-CRM114-Status: GOOD (  10.25  )
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

On Wed, Nov 11, 2026 at 11:12=E2=80=AFAM Valerio Setti <vsetti@baylibre.com=
> wrote:
>
> The documentation of 'struct gx_formatter_ops' states that
> formatter's callbacks for enable/disable/prepare are called with the
> spinlock held. Validate this by adding 'lockdep_assert_held()' in
> 'gx_formatter_enable'/'gx_formatter_disable'.
>
> Suggested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

