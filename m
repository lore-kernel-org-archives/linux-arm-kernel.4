Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2302606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 13:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dKqqWOXD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DO7hJg5G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TqxF3+Nzkhor0rRV99EpRxde5TNqiKQhUCDZraKCV58=; b=dKqqWOXD8IvjY2S5Qs4T+E6AAa
	rV3vNro6aZCRdZU4GmFZ0kMsl+EMA87Y+CIXsB7wzZZ69T2LfPWnQb7HLdu+vwuDthEih7/rLDAOu
	k/I1RolWJPDcY7bc1wpEmxe51BzJDy/Kte6dQTQOZbrEKaPYvPRd/u79iyzwVHN+k1ohtkyUmj+Zh
	NLotUT9vPFI7idONm+GOWTDk2NWVt7zcRa9YxDBhgp3Gk10MRixV8uJPyNOzvcOJrXmGh1Y4e6gCv
	GOf0PFyF+yF0txec4ngsS76DHc5O8iIKUrYPGrynI3kpqMJVldJ1OQ64s6qveZAN9C54L54hscciT
	PKjQiAhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfcI-00000008w0q-41yR;
	Wed, 18 Nov 2026 13:22:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfcH-00000008w0g-1F17
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 13:22:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 25DBD60D5D;
	Wed, 18 Nov 2026 13:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1625A1F000C4;
	Wed, 18 Nov 2026 13:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795008142;
	bh=TqxF3+Nzkhor0rRV99EpRxde5TNqiKQhUCDZraKCV58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DO7hJg5G8BIHWFi6/7b2uzjMxE/9ta8tSvSUfg7HxZBnJnNGeXtuVAoZPQbli8kol
	 PCPm2gbN4W3FUcxJ+W2rGlxce+s47yRimr3CBF1e6V4RhmZCJIkBlQ1vWqb3gTLBeJ
	 3hkaHnXcIhNUqORVq8LcNQvO+JQZMr7OmmebQKThtyASTXujFzAlskwxF5mbIBbRK9
	 NHglysLUV7zJmslzzbPQAbXFhq+CQ5f9K+G86qUIbMJ25RBTRlxOdLHFJ4O4S+6IMz
	 +ZlH2FPpa9gK8Qh25U3eVpvzxcd8H2W5Y3NXK+30x3mYqFzyaV+cO7H2sCY/aA25Ej
	 eVFrqmZD+bsRw==
Date: Wed, 18 Nov 2026 14:22:18 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Thilo Zirnstein <thi.zirnstein@gmail.com>
Cc: michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: Re: [PATCH v4 1/2] i2c: i2c-xiic: fix clearing of bnb irq
Message-ID: <av2jSyTFI1VoyGSU@zenone.zhora.eu>
References: <20261118101147.3350796-1-thi.zirnstein@gmail.com>
 <20261118101147.3350796-2-thi.zirnstein@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118101147.3350796-2-thi.zirnstein@gmail.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Thilo,

...

> +static void xiic_clear_en_bnb(struct xiic_i2c *i2c)
> +{
> +	u8 sr = 0, isr = 0;
> +	int ret;
> +
> +	isr = xiic_getreg8(i2c, XIIC_IISR_OFFSET);
> +	if (!(isr & XIIC_INTR_BNB_MASK)) {
> +		xiic_irq_en(i2c, XIIC_INTR_BNB_MASK);
> +		return;
> +	}
> +
> +	ret = read_poll_timeout_atomic(xiic_getreg8, sr,
> +			sr & XIIC_SR_BUS_BUSY_MASK, 0, XIIC_BB_TIMEOUT_US, 0,
> +			i2c, XIIC_SR_REG_OFFSET);

this is a bit of an overkill: you are forcing tight loops for
1ms. If you consider that the minimum wait is 1ns, in 1ms you
will end up busy looping a lot of time. Please, don't set the
delay_us to '0', but calculate a proper waiting time between
reads.

Andi

> +	if (ret) {
> +		dev_err(i2c->dev, "Failed to clear bnb\n");
> +		return;
> +	}
> +
> +	xiic_setreg8(i2c, XIIC_IISR_OFFSET, XIIC_INTR_BNB_MASK);
> +	xiic_irq_en(i2c, XIIC_INTR_BNB_MASK);
> +}

