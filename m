Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFAE606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 05:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KQ6XUwot;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TDGIJHWw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JW3ojJgWSSpYVKAj1rpR53Wt7zgOalc2QFQ9CWv61+4=; b=KQ6XUwot3AuzGnu+ylPTl3lach
	GiHvVg4hayEdZZAoa4iqc2Q+bKL5g+ygsP8Ga5s2wYDalBjug6nBMg+7qYlfFXn7BRNGFOlXQuoWF
	HEjwkt16ssNALiF/2bekAi8SHC2A4AdmOAtisFxieGzdahLuCjj4yZHC6SOnF5CqsFOLk/VkmqG4v
	S0aCHb5px5n3vpaHq9I7/lmCLm3AUbpZ3+Rjh4ObLB9E45/KdP2esz1cjFAUpeyRh8dk87SpVELju
	W6NZJ8MlOkY20iwOaebxNgjn6ObCx7d5fev8ihHUFN5XyfzjihDa+aVXaPGY3iP3mGHAO9GDhuPat
	0elHpbeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMhe-00000002JnW-2ejP;
	Mon, 23 Nov 2026 05:34:58 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMha-00000002Jmo-3C1b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 05:34:57 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-1b546061d58so6584480c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 21:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795412094; x=1796016894; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JW3ojJgWSSpYVKAj1rpR53Wt7zgOalc2QFQ9CWv61+4=;
        b=TDGIJHWwdKMLY/kkkRTRyVr+4JRPw1XxTLGIL+GjFwodYSfG0Ka0zkfjN/U5kSORD7
         HRqE4n26pgITBJ209V57sgHe2SX6AfW2auQzHYI+9hmVALnP3G53V1mdGBedojs21vaV
         aAwVpGBzBvqa3NW/PPvhONS1+HuqqFOT0oi/IkpcNy71QIrPRslu1mnIY2GQnrL935iR
         cmlv0ldR3uTYgoTXO2rgW6e7+cSZhWLM71bb6RswMPi0N2x1DmfqYNGUJSIR/+g4DCQz
         o/xYBDs1mvuNxrOLOSz+kTe4FqL1iysONLb7mNHxMiMGzO+GnxvprUYXNrfJTEsHk6+V
         JoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412094; x=1796016894;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JW3ojJgWSSpYVKAj1rpR53Wt7zgOalc2QFQ9CWv61+4=;
        b=g/3RF1gmuT0miK+OURcC5P+RejvMwU0u7evEPCuAKUcNmvmJUr/B574uETU2F5Kwv+
         qX3nYpMVQCLnmXrqMpwmvqRo4j/NVKbIHyS9N/SqBDXLXGQMt8JIiKBbas2XsjgUKgPJ
         +AyZLQEhAJwd0qJtQnUQbZTIqkiAfMOanyUFJSQvgTwYlVk0VpC3QSfLJjCrZsMD2tWh
         ml8tFh0jd/RGyF2au+hOF15fA671tnbBeqTTBJ7Hu8McgrkrXrEwHSEXOJujsXNqw6dJ
         zRsrMkbmghidmXodbhdUBOcH/hwuqT17Yuh04NJBBdVSalb/G5VyAJEURQWMe2rRp8K3
         dLgQ==
X-Forwarded-Encrypted: i=1; AL+hErGtqlcoG89QZKlKkTzEztbeEqvTwagxb4sZ4Qywx68kwTmnGfWJTnkRgkOb8LNcaRbVs5Dxw+Os0ZcLCgTbuYBi@lists.infradead.org
X-Gm-Message-State: APuU4Z/3RIg0yy9N7a30AYi1s1alt2H9mgEvtTgTz+YbvVm72gn7JgEm
	steTjExcZCPBHZdEm65BjJJhQj8jcKIl2EPy1pKVp0g/tRYs1qTUm7pDLb+L/emEJHM=
X-Gm-Gg: AZFdTZcp03F1vxJrzGdcgOs07l13HXh2RjTywbipLSiR1jUBC47Si7vS/1PZlTjkmxJ
	xca1VbYlp690eatnAUyTLp3JD0EZd9FPb0xmDhhypqaA44QT4BB9RrDyTa7aOGMPYbGyricNG9M
	WZdBK9JHj2lEP9fIeLuI8JWaU5gN+i5KI468QPHgtBPPmaapDRK2IdASFmU4NPiJyr7uKfYk02y
	Kf1ny1OMV0dck67gHW6c8LdpCudSqRt0K4vAWRbRIJ+HAV5Gc1wNlD40ezz559h31LNQmqRa1F1
	8ba1+S1PQmA4/wx5oTcWEDTot9XXNO3RvnE01BGh15kUvcZJoYe+XsC1IMCsennQIcQBuZ0i2eA
	qOzLnXULSXeEtW4witpZd0bFQkIVqQGnsrUhCpAjHdV5/TrsYMFhi3d5WccYOB8mEEwuwGXwPuK
	RazJDNM4rD7xZ2GCbVZzHTTF/3XSt2ynOL6rInFDTY+lZUKheAkW56jbsDW6bcSKzbrB0cBkL2e
	lf7sZLRz2lwCxU72Cu9nMNNuqazTfZLBYYXmTQmqQPBDi3mJ/5jM99CNk0K5Rj1WGyVYlS2BeCI
	L3nSmGBs7gtTIYtCFd5+d5DsrvgV+w==
X-Received: by 2002:a05:701a:ccd9:20b0:1b5:7351:955f with SMTP id a92af1059eb24-1b573519624mr2091488c88.27.1795412093505;
        Sun, 22 Nov 2026 21:34:53 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5569bffd2sm23537896c88.0.2026.11.22.21.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:34:52 -0800 (PST)
Date: Mon, 23 Nov 2026 11:04:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: shyckless@gmail.com
Cc: rafael@kernel.org, peter.griffin@linaro.org, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com,
	linux-pm@vger.kernel.org, zhongqiu.han@oss.qualcomm.com
Subject: Re: [PATCH v2 0/3] cpufreq: Fix leaks on probe error paths in three
 drivers
Message-ID: <awPQeliuPmaBF8cG@vireshk-B250M-D3H>
References: <20261123-cpufreq-leaks-v2-0-29277f2f0ddd@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-cpufreq-leaks-v2-0-29277f2f0ddd@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_213455_145708_C9E1C894 
X-CRM114-Status: GOOD (  16.30  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23-11-26, 05:21, Suyuan Wang via B4 Relay wrote:
> Three small fixes for resources that are not released when a cpufreq
> driver fails to probe: the cpu clock in highbank, the three clocks in
> kirkwood (also on unbind), and the regulators and register mappings in
> s5pv210, and its reboot notifier, when cpufreq_register_driver() fails.
> 
> Found with a static analysis tool and checked by hand. Compile tested
> on arm (W=1, multi_v5 for kirkwood); I don't have the hardware.
> 
> Changes in v2:
> - 3/3: fix the Fixes tags. The regulator and reboot notifier leaks come
>   from e8b4c1986efb and fe7f1bcbff91, and e0e5b2b4f427 did not add a
>   leak (Zhongqiu Han). No code change.
> - 1/3, 2/3: unchanged.
> 
> v1: https://lore.kernel.org/all/20261122-cpufreq-leaks-v1-0-96fc17ff7339@gmail.com/
> ---
> Suyuan Wang (3):
>       cpufreq: highbank: Put cpu clock if clk notifier registration fails
>       cpufreq: kirkwood: Put clocks on error and in remove
>       cpufreq: s5pv210: Fix resource leaks on probe error paths
> 
>  drivers/cpufreq/highbank-cpufreq.c |  1 +
>  drivers/cpufreq/kirkwood-cpufreq.c | 15 ++++++++++++---
>  drivers/cpufreq/s5pv210-cpufreq.c  | 12 +++++++++---
>  3 files changed, 22 insertions(+), 6 deletions(-)

While sending a new version, you need to add the tags you have
received so far. Please resend with Reviewed by tags you have
received.

-- 
viresh

