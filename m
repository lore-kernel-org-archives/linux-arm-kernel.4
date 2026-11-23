Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEDF606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 13:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nl4M9BUQ;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JIq3PC1Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=; b=Nl4M9BUQx618IY
	3Kd/G/lVV2c9+eXT/Wo7qb4NY93izCIHQWIXS5+7WIfJqh3Oq5eNp57cU1xwhRdm7lkzR1vBfA6eo
	ZYnM/yi92ckPt7NXY4xoPBjNCXRZ87t3/5RR621bZmpH7SDOoKpV4N/X5D9G0oYm3RIzfe9JWhiAC
	ulZGWfzxanHUbXO6g4vlH1BYly/iQ7krBhfD4ztWgSf7ZrRIiPghh5ZdKDY4zwVtLOP1CT8eumzk4
	NaFgYokZ/rlDHDQW+KuxFT6OQK3v6QTJR+N9PNWH95TymDQxmB5Fwmx3urGL2u9kA8uWe3LaNgJQ8
	s4CmvWDM2w1JmUQdNQcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUAV-00000003aYG-3eZ7;
	Mon, 23 Nov 2026 13:33:16 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUAR-00000003aX5-1Uzz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 13:33:15 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c5188e17487so54725266b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 05:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795440789; x=1796045589; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=JIq3PC1QK1RY0i95ufg3vkNvBS8ur79Ww4lO1ScdobcM87x109z9qUtYHfeXDIMXx4
         EgGtM8P3IjHfW3iA45BU0KQGFSagMxQvgLqKhszB9mkr6wQyMfMa3HvnfdpBSvnL6dl8
         9tG3PJ/mtJ42k/UibsmUw6O2W1fuWSwzc1KN16R38kiMsRvFsCiqlZK3IWpSDdfhbDBT
         w0F1zdDJ4tstdnUGJkwUE7po8Xaiww967L9oj55Ujm8bRA2Ob3YAmhNpCjVDzGPna8NZ
         i3BCPwsf/uI8YvHvCvwflizDvpeUILbCvrc+gVyiuC9hU8M5Ri/O1epUqR7cSIk5t0ox
         3l2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440789; x=1796045589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yyfk8X7hQAsUD9G+4fe4CzUE4boCyIRsCV8/4Z21Gnc=;
        b=QIBi9wTRM/FuXmORtWQoSYzmAaDfoXyAJ8nMOegKUBzq/fQcKj3GpymK0ObGFEEQ+E
         wkEybjt6Px7a12MF1WVO+S8thtRHuw6Ao6iNomdkqrIoM/N5fCTDvynFkhkHfb+SpLnM
         thLLtbJuxFscESfVMUBgunLCy6e0kFTKLtk2fLB2p37Y5Oim0WKp7O/xxKQgBexDdear
         AHG37T+4SBkfTo3D7Z//+MciWAeVRxCgBflRWuLX6ylKprncsdC+CF8UfjLfFcdpidQ7
         Df+jutyVBilF8Z2Sg2ZADP3AIV5xlPR8V/PCtQfbtJBH8KyEP7lrgdaXcD6h2wNMxgLD
         joAw==
X-Forwarded-Encrypted: i=1; AL+hErFKO7wSjQhNFnTqOZV+FuUhg8UKuo2gOEB/y/MZungU4iWs5URdvHIDjysHpAAa/vBUftvxeem23AgIif+hznWW@lists.infradead.org
X-Gm-Message-State: APuU4Z9wfJiaKMNmqCfdKg2DOwtK5HCW1J15mz7iqABINIHI60ZybJwD
	FahQiYd2rn1uMzhk2VFbSUaFTYWc8wZa0I1n+rh6ufVuRbXc8ywmvoTSFqxKms0LVOw=
X-Gm-Gg: AZFdTZfN1gxVXtM9HyC4dRkmrr1YAxCUkxUxk0EilCwKqIeHP0ZXrHu5oNUByIlUYbv
	/FIwZGK7Ldi7Ha479O6yxmvrvQXG9a/m91B5e7ryhd1tZNhB1qGPAaGijQ+ByXJt5orWzb6KXUc
	fvFZcsKdvuM2mbVeUafMIi9NbJh4GiOZTfP/Q4UCKVzUniC2G78xCUEwFE+MGMIoeVy6CHtKH0/
	HLgZSzkqrJvhV/3k1svWaVrDEP1iBBe4of7T0/Vf7O8nFAmKUjewX4tRylShpkTgrPQAYCV0Lgx
	CRHqrpL5IrC2N0pg8ghjr3ibRNXnk4qCuAQNbSTj4/RDHK92JgNonShvuxJaWb+kvaYa/EtVjWU
	kQ+vQA7YXgRQ3tafE2NNMohHLTO1pMMfjA9q7AVceTlCzzFX5lsSpAI7QtTuB2iaIJfzSN+yc+c
	IB5U7rjeYumr+9Sz7CDf5ayXqwG7vayOBwfl4Dtno12E4dDLeeXOAZNSR+MMh4Tdg3/AjOQya+b
	0xhAgXF44Hxx4hsd95EMsITW7WB6j0GNkF27zGz6CdFR+E0ZV1sbCpz+EC+gIOG/4nNEc7bKwB9
	KdnCBTVyVCequvdqe+v2e8zM2IUkIdcJ51pzuD4=
X-Received: by 2002:a17:906:a88c:b0:c29:22cf:b0f5 with SMTP id a640c23a62f3a-c513ab3ad84mr761410766b.33.1795440788381;
        Mon, 23 Nov 2026 05:33:08 -0800 (PST)
Received: from [10.11.12.111] ([79.115.63.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68788sm407213566b.29.2026.11.23.05.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 05:33:07 -0800 (PST)
Message-ID: <c3200683-9d2c-4ab3-bc7a-d78452456bf3@linaro.org>
Date: Mon, 23 Nov 2026 15:33:04 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: samsung: acpm: Don't use pdev after putting it
 in acpm_get_by_node()
To: shyckless@gmail.com, krzk@kernel.org, peter.griffin@linaro.org
Cc: alim.akhtar@samsung.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20261123-exynos-acpm-put-v1-1-447097ce7998@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20261123-exynos-acpm-put-v1-1-447097ce7998@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_053311_411769_DCCC12C1 
X-CRM114-Status: UNSURE (   4.97  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

