Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 671FD606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 02:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yMPdSN0N;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XchuFUIG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zWLtW5HVloB72K34QD88vqK+tQzm7URWbYRu0Qwt2rw=; b=yMPdSN0NWjZXz3
	4XNhzeAxDOzJTwM8/83zfkMxCgh3Y+t9L+zCToc7USQ+JbxyI4g54jOzhyon7tPHjJWerI//fl9Uk
	LQn2zx/WWnsVaS/gyWRwj+szzPPs1t7Wx4lnPT9cTgiXbfMR/X9QK7DGpptAZ9JV7r1DNNm0wfupe
	X7EdQBR5z27oFfBcUrC8AHwIEuxqxNo2q0ZR5J2wqpPYj5Ojd42h7oMyy/EL4Rp3QpP0gsNu0KDTB
	7jK4YS0ySxIbUiDrsHj7iDElZKFD+i/7Hj2tKyucVnbu38IddVU9Cs/j5zUAMdznT1mQUGIL8nOch
	bAwmaM7eSa/Xro+5wgcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyHJ-00000005TWt-3QHD;
	Wed, 11 Nov 2026 02:41:37 +0000
Received: from mail-oi2-x02.google.com ([2607:f8b0:4864:32::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyHG-00000005TVn-0gRT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 02:41:36 +0000
Received: by mail-oi2-x02.google.com with SMTP id 5614622812f47-533fe730856so1176783b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 18:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364893; x=1794969693; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zWLtW5HVloB72K34QD88vqK+tQzm7URWbYRu0Qwt2rw=;
        b=XchuFUIGvw1kjvLB2zKD2vsYr0K3gIDdPJV38xLSOA6aakRG2CPtigEMWtzvVgLfaH
         i+Ss65PFpiGrHfbO9cyPa84Ttef5KwO56zbkLXhswz16qO83bcLtrCHrKqirbzpaxKQW
         cgoJ6f+9uvxTOQt6xuPdoB4N3uBwxhtGucelqosDBoSdBGka7tlSIgfmKWpXmGvUSryK
         h1Aak2NJYej02efIJOlBDXYa8aODFRfO4xz9Yl7Y+cywYcDTMtfdi9Exz96NLR074O3w
         1/AzmPdD59B/1P6Jt/cPx7gOBe2GoAhrPThucMiynewExaCWRrrkOG2WINC2iSskBtn4
         4Wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364893; x=1794969693;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zWLtW5HVloB72K34QD88vqK+tQzm7URWbYRu0Qwt2rw=;
        b=vc4xGwJXMrjvden38Cc4h+obmWyCgDWfdSlVcYf3GZitrbQr31bxqwrPHmJU0Mxkyw
         7II96yyYGLWzKlK0JvCYkOGmrONZ9DjxtJW3Sh+oCBaGlRj8to/a693Kh8gJT028KF/a
         xxoVJKEbwLW4bxDpJnNQQhyxZjViYA5RpPYqy1EjhvTner4s/eFpSeSkCIxXvEmyx6Xj
         V0YplhI3u1cD1TuMEyq+q1RP6FJ9+e68Thn6VsZAfDh+385DJ7b3EqKN+LsDxs12LVeQ
         KUSk7yW8to19bazk21eDSf1Pm2TjK/zrtwiBf0uKyLN0ymZKOmB1rKoXfIsvscbHqPLT
         c4zw==
X-Forwarded-Encrypted: i=1; AL+hErFwJ6n4cehD8zIHsqhsUlod2ZixT5N0S4Kq79C/jMlaZf4ZobzrpcjUIaOEL4lh3vaVPTMkm9gOpBK5+yx9C1IB@lists.infradead.org
X-Gm-Message-State: APuU4Z/ZG5282OoEHxYnCBG5/pl8dp1nTmVX6SfYNMCpFOy1Ybw74qHH
	fxovc3Tv9vU7Y4BeESmip0IsnKeFXpda5Q8uwiUA2Ix7LvYvLUYblLsw
X-Gm-Gg: AYBFou39Z8EMqdSxzEw5En6ePA4+kAx3p9eWVYJMHM/t0jrvKGoxEUbLOCQwhcLm27s
	IgeO2dM9gOv/DGuzd5v1oLteQOOmpwtyU5juu60JIM2gX+G56No+5d/u8EBq+BikrAHnGR8xkTR
	5w+aIEM/v3625tKFY+7oLS/cXPY4sloSGS5Wh2xr/9p9uc3xNQQTD4jiaykLTyv4opH8qVWSnc+
	B5845plHi+xd9SLstzrKUiWyFy7waNuAz9meiBwcDRxKRyIZYZ0fHJFdhpcqalWs4cs3x/rT0W6
	SHMqQL62EN8GGyVFqZZvrLirLlUoHzmeY6G8Ik5TIm3D+1xjWXsSn2x+QMBXZ75bTFz5DXnroR0
	es1ZKDzBbWsBk0wCLadAW7jCbnOsQ8HkOr2udTyZF7EC08JFQk25w4Ea5jjkqlhy0Vig0l+T778
	j7Yz+CQ6NDawa38UDMAracl4W/HOJreg5I/i6Ed/CkhRyDw/wV3AeG/P4aoAuJwOEYq3928imKm
	pFAntLaBT/ltSSGdqnsLJhTRYAtPOD1xrP74c8PT/A3YfAdes/1973vavkE64+jxDHJydyUYG1e
	VjWn27x0GCKDB6PQGtbjA3aivTW8f9QAMdZ7snlFrDhiKA==
X-Received: by 2002:a05:6808:c123:b0:4d5:291b:b850 with SMTP id 5614622812f47-56b9770f25emr830098b6e.54.1794364892987;
        Tue, 10 Nov 2026 18:41:32 -0800 (PST)
Received: from ?IPV6:2600:8804:5716:d800::f01a? ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm3857157b6e.8.2026.11.10.18.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 18:41:31 -0800 (PST)
Message-ID: <a5fe0bb0-547b-48a6-95d8-6132df7f4192@gmail.com>
Date: Tue, 10 Nov 2026 20:41:30 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: Enable the GPT irq
 before registering
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_184134_240950_1C14B881 
X-CRM114-Status: UNSURE (   9.61  )
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/3/26 5:17 PM, Ryan Brue wrote:
> [PATCH] clocksource/drivers/timer-mediatek: Enable the GPT irq before registering
> [...]
>   
>   	/* Configure clock event */
>   	mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
> +	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>   	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
>   					TIMER_SYNC_TICKS, 0xffffffff);
>   
> -	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>   	enable_irq(timer_of_irq(&to));
>   
>   	return 0;

Hi Daniel and Thomas,

Could this go in through timers/urgent for a 7.4-rc? The regression come 
in with 7.4-rc1 (7a097aba7255), and on MT8173 boards with PSCI CPU idle 
it hangs about half of all boots: 20 of 40 here, and Chen-Yu sees it on 
Hana as well. It now has Reviewed-by tags from Chen-Yu, Angelo, and 
Luca, and Tested-by tags from Chen-Yu (MT8173) and Luca (MT8167).

