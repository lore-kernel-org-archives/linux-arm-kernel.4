Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2261606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 22:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Db9HKrsC;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CCH6y8Mp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eGiTz5a4RWzDfrU+6uE44Y9DQD7JN0lrvIFzNORDJ0I=; b=Db9HKrsCuArV/N
	1pHDpkpiU5NuNVpd16wW3Qa+r+ogzPN8N/T0nY/HHQxOQPiY2kGiCsy1h8gIHDL0MYjVZZ/E688FC
	ahmZL9J9kKlYsrW/voF64ORxm13RVHjwUbBbnWVooSjijPC32PGkLBjP1lQxDsVUYho+WRHK3puEd
	QXy6VbW0o2cMV2eLJFQotWL3tFiEkIIgS1xoPQPL5PFH0NCJ2Uw1fQbenUB55Ck7ltUkHRv6fBHc6
	JDt/IciCLBpPPUgSaDFLMMMhkeIW/pMq8QRWRz3w3zq6ssS+PC9EM3L+vGmwJ/xJiBxMdytucyvUh
	AknJlfCzsl48ExrnTN1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTnom-0000000AO4a-10yU;
	Wed, 18 Nov 2026 22:07:52 +0000
Received: from mail-oo2-x06.google.com ([2607:f8b0:4864:31::6])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTnoj-0000000AO3i-1g6o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 22:07:51 +0000
Received: by mail-oo2-x06.google.com with SMTP id 46e09a7af769-862990b7bbbso487106a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 14:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795039668; x=1795644468; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGiTz5a4RWzDfrU+6uE44Y9DQD7JN0lrvIFzNORDJ0I=;
        b=CCH6y8Mp2nom6NtzDtme9jPQZdKHEq/rzIyPD4kzZjQnDtsAU7ERt/o3vxFuzGL3Dw
         mRvBJJvfTY7R3/CgjVTF8IVBya3al46Z3VqwovaKYzusAb6+7Gx/9auo0EdviOUL3g8R
         noNLqsLdRKq6ajmNHJlNrKlDunu0gpbJqO+8a5dtnLK2Kc067xnOgQtzWlEkMYXKrb97
         xfeUTEmm1y8Gr9lzoj1JgQMlKlZWyzS2gTmmorI4BBRuAkQlJ/+YuxS3umIco+HC7aeU
         ZUgmnfVee3V3wjk3p7SAH8Ntn/2z6AVn9Mir4mnjndnq/JUX+v63xyPivAY2/w2wKBTB
         ubog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795039668; x=1795644468;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGiTz5a4RWzDfrU+6uE44Y9DQD7JN0lrvIFzNORDJ0I=;
        b=FNKn99qqg0s7HOAO34HyNMIti9gnjNaX+cboUWLvKeMDJuunXKh9MYDbr60piU5LlU
         98K15JY0Mghe++BD1OIRx7Uc6BwRxIIrDofRc/By0x6bI0IHfJaRmRctMZ1uA7Os/HkW
         vWzdHMhD0zdpe94xvewWnf/Wx0BC3flceSdJSnZKs+XDSqOWLNEYFjEWYn9AK37ZtHRA
         yMjOq0ZCmfMAw0VPZxSJE5Yn2qR4Zb0TToqSG6vhW1JnuhIcu6qqnO5p3Yo9jN4qg0xx
         ze5G4HkYcinwRAVBuxncEU+X/B0GhvpWNUc/DNcxfEQdaD/p58cfX5MgdMUZkBPHqG75
         d9RQ==
X-Forwarded-Encrypted: i=1; AL+hErEShcGo92dBvWyEw2L6Ay2BcGSWDnvdm+9Vb2nTMWkhfsJXZVetiPkMkbXvWLm5uG4R7g5ILelAtMUrCCNvcr/E@lists.infradead.org
X-Gm-Message-State: APuU4Z8vIrDbeBF3FpekT8kJ3c5EnoowqN6liYZl88NyCWurf4q2LV5W
	tQa5LcCrxSYOakFYn8u/R9D16nyON6A0WfwU8uwIY3KWEtbmUZKCJKI+
X-Gm-Gg: AYBFou0LDcayqFPtv/Ts1x7LXA/8s/6cWG73ct/XtDi9doopGm+qNu9nYg2DZ8ggLp0
	nfDOJU4OJupsrZqltbryodAOFpxbnQZaEeTd8fP4o0jWa9txKY6dfh4RMSKfHsdSNIASjU+5pib
	J1y1K37tc7XfzTegmU2Y/lygEWH9Oogmn3QCsGbNMWjkwgEDnLqJr+Z9EEvc1+RsypldwxnDq4r
	jILkgmZWtVujvFd24oJLYA6vWmChrbat6NC+BFQaJqnYjAS9WthuOfmGrRsWI/Ch9CKySnYdVsb
	wrqhwReiD0V+/6/x8JHfWQlP7EFc01BExoWJ3L3gFRJjXdOk42dXdEwMUuMj3k9qbT0hESPmclA
	vh7aLJis9OXUUW0cVXE+8KCj1yMeM6SnQp4gnWlVLae0Buo57xgPuU5X5+SRXJxLE92FtxngH4Y
	Zwrs3RLH++zbzsjTalni5M2kW4aUVKQZk3/wXgyIm2wH456o1YLx5c20fNoI3ceoENrNypu5yPv
	MMIbezJAmVKFNABTVcpCoFUCj6/C4Yv6a/E3yWPlGpYuWykf2f6auv/ieaP5b7HaAJ9a0z/qXYW
	vMfknnWV/j5ZaBLY7/5RVSa8KBX8qbUlFHDrfX6aU28rjq2YlEYpt0o3K2jSTkvsejmNxjjsNcW
	wMev9bjPTyVv754RgsJYY2iYeLd7YCuZ8tuQrPy7RuQ==
X-Received: by 2002:a05:6830:3495:b0:829:9992:20f0 with SMTP id 46e09a7af769-862f08c9ce4mr4131980a34.28.1795039667975;
        Wed, 18 Nov 2026 14:07:47 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f021aae9sm3024029a34.18.2026.11.18.14.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 14:07:47 -0800 (PST)
Message-ID: <2fb4e011-8ee8-408b-8684-f3bb8e1ac624@gmail.com>
Date: Wed, 18 Nov 2026 16:07:45 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] iio: adc: add mt6397 PMIC AUXADC support
To: Jonathan Cameron <jic23@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20261025-rbrue-suez-upstreaming-mt6397-auxadc-v5-0-5c3c7a5a1851@gmail.com>
 <89c8cadb-0ccb-4aac-9b95-89f355beb24a@collabora.com>
 <60eeaaf9-57db-4ca7-b4f5-bdec111dcdbb@collabora.com>
 <4c64aa52-2b75-427e-8f26-c2ef7fc5b822@gmail.com>
 <20261118215144.301c2467@jic23-hlaptop>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261118215144.301c2467@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_140749_484835_696A50A2 
X-CRM114-Status: UNSURE (   9.64  )
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

On 11/18/26 3:51 PM, Jonathan Cameron wrote:
> That's indeed a common solution to cases where a binding header
> is involved. So I'd do this - then chase with a patch next cycle
> to use the define.
>
> J

I jumped the gun a bit and sent out v3 of the suez dts earlier today 
with the proposed change [1]. Should be all ready for AngeloGioacchino.

[1] 
https://lore.kernel.org/all/20261118-rbrue-suez-upstreaming-amazon-suez-dts-v3-1-c1a8b0febf35@gmail.com/

Thanks,
Ryan Brue

