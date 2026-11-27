Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86C7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dh8Re2J9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lzPfB6Hb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aTyAya1d1zqdX8GTspb3iJbYPHLH49K6JMnaMt5ObMc=; b=Dh8Re2J92CSqC1FyAvi8QDJG3k
	LWCyCGdy6zM7W/RWAb/Phml6kUO8BiMcufGPqrUcEpaU5Txg/UJB8Ux8zouMJvW3QJoWpInupSAnq
	RJEUW1n7MCtvXq/y4xDViBxpS6Mo0hfB4y+OhS5PL18J91d/jKh8GuB3JkdsO7nO4RN+mDpfk7zYn
	RLNjYEVagcxL8fFd+toVcQEtH+ZPJURzud/EGxetUtLmvK/viUVVZBnQQ/uMpl74xYdj9wFZjqhfE
	CI5bPkHbZnkIm4utcPJyGBwePZrx6yogQmADuNti9wZ/jjjNAEI9hKNSpvFwgN4dIw3XpyOmGUQ3n
	D3oC4vJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxXy-0000000GhSv-29hh;
	Fri, 27 Nov 2026 15:07:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxXq-0000000GhQh-1WKg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:07:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EA4BE44743;
	Fri, 27 Nov 2026 15:07:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB481F00919;
	Fri, 27 Nov 2026 15:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795792045;
	bh=aTyAya1d1zqdX8GTspb3iJbYPHLH49K6JMnaMt5ObMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lzPfB6HbaDwJ2td2ml4g6OvwLHYFRM1I1iWTRkA61A2PFG6oKvGgtEyLdBVwaz5m3
	 0ygZonSU39vbFTwPMXw7kYpXwCGBWQJq+HC92kCngOg+yU9NsTwmnKIhagSav1krfX
	 g0zCkP+Vyc/bJIGfNbpnXOmNxxW/aPl3U1VDbwk/PmuYdxML4MGwUp6EWe1mImohkC
	 3mU9ZBvvW0YDE2BPJdTjaK2fwo66sbcGIA5LHiTAximbo0yVi89CYZFISrHWXoTjQJ
	 YFexxJHS1klmAjXpsPr69DpZHfiC0s9PcfLwFlHn9SONhOcdnfrpTZVf2R8hlGEURG
	 AtLBuxqtd/zVg==
Date: Fri, 27 Nov 2026 15:07:15 +0000
From: Lee Jones <lee@kernel.org>
To: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	mfd@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mfd: stmpe: Disable regulators on probe failure
Message-ID: <179568586298.32537.18171310345438853843@kernel.org>
References: <179534733065.15652.3659794654405986240@mail.zgclab.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179534733065.15652.3659794654405986240@mail.zgclab.edu.cn>
X-AI-Review-Draft: <179534733065.15652.3659794654405986240@mail.zgclab.edu.cn>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 22 Nov 2026, Haoran Wang wrote:

> The VCC and VIO supplies are enabled in stmpe_probe() but were never
> disabled if probing failed later, leaking the enabled regulators.
>
> Register a devm action to disable the supplies, and track whether each
> supply was enabled in dedicated flags instead of consulting
> regulator_is_enabled(), which reports the hardware state rather than
> whether this consumer enabled it.  Drop the manual regulator_disable()
> calls from stmpe_remove() so the supplies are disabled exactly once via
> the devres action.
>
> Fixes: 9c9e321455fb ("mfd: stmpe: add optional regulators")
> Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
> ---

Changelog?

>  drivers/mfd/stmpe.c       | 24 +++++++++++++++++++-----
>  include/linux/mfd/stmpe.h |  2 ++
>  2 files changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
> index fd51ba74275c..fb30b8a4fbac 100644
> --- a/drivers/mfd/stmpe.c
> +++ b/drivers/mfd/stmpe.c
> @@ -1362,6 +1362,16 @@ static void stmpe_of_probe(struct stmpe_platform_data *pdata,
>  	}
>  }
>
> +static void stmpe_disable_regulators(void *data)
> +{
> +	struct stmpe *stmpe = data;
> +
> +	if (stmpe->vio_enabled)
> +		regulator_disable(stmpe->vio);
> +	if (stmpe->vcc_enabled)
> +		regulator_disable(stmpe->vcc);
> +}

Yeah, this is worse!

Instead of manually tracking these, why not use devm_add_action_or_reset() for each?

    static void stmpe_disable_regulator(void *regulator)
    {
            regulator_disable(regulator);
    }

Then, when regulator_enable() succeeds:

    ret = devm_add_action_or_reset(ci->dev, stmpe_disable_regulator, stmpe->vcc);
    if (ret)
            return ret;

    ret = devm_add_action_or_reset(ci->dev, stmpe_disable_regulator, stmpe->vio);
    if (ret)
            return ret;

>  /* Called from client specific probe routines */
>  int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
>  {
> @@ -1410,13 +1420,22 @@ int stmpe_probe(struct stmpe_client_info *ci, enum stmpe_partnum partnum)
>  		ret = regulator_enable(stmpe->vcc);
>  		if (ret)
>  			dev_warn(ci->dev, "failed to enable VCC supply\n");
> +		else
> +			stmpe->vcc_enabled = true;
>  	}
>  	stmpe->vio = devm_regulator_get_optional(ci->dev, "vio");
>  	if (!IS_ERR(stmpe->vio)) {
>  		ret = regulator_enable(stmpe->vio);
>  		if (ret)
>  			dev_warn(ci->dev, "failed to enable VIO supply\n");
> +		else
> +			stmpe->vio_enabled = true;
>  	}
> +
> +	ret = devm_add_action_or_reset(ci->dev, stmpe_disable_regulators, stmpe);
> +	if (ret)
> +		return ret;
> +
>  	dev_set_drvdata(stmpe->dev, stmpe);
>
>  	if (ci->init)
> @@ -1489,11 +1508,6 @@ void stmpe_remove(struct stmpe *stmpe)
>  	if (stmpe->domain)
>  		irq_domain_remove(stmpe->domain);
>
> -	if (!IS_ERR(stmpe->vio) && regulator_is_enabled(stmpe->vio))
> -		regulator_disable(stmpe->vio);
> -	if (!IS_ERR(stmpe->vcc) && regulator_is_enabled(stmpe->vcc))
> -		regulator_disable(stmpe->vcc);
> -
>  	__stmpe_disable(stmpe, STMPE_BLOCK_ADC);
>
>  	mfd_remove_devices(stmpe->dev);
> diff --git a/include/linux/mfd/stmpe.h b/include/linux/mfd/stmpe.h
> index 87e29d561e22..eec5fc795014 100644
> --- a/include/linux/mfd/stmpe.h
> +++ b/include/linux/mfd/stmpe.h
> @@ -122,6 +122,8 @@ struct stmpe_platform_data;
>  struct stmpe {
>  	struct regulator *vcc;
>  	struct regulator *vio;
> +	bool vcc_enabled;
> +	bool vio_enabled;
>  	struct mutex lock;
>  	struct mutex irq_lock;
>  	struct device *dev;
>

-- 
Lee Jones

