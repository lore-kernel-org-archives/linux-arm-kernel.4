Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B24D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NH/6GARc;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=dhO40is0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3Rc6Ro7bev2lB0U+4JqWHjc10l4sUHoK3bqnfNloXx8=; b=NH/6GARcZr7s9noFGXwU5aJMKF
	2Buh32ttZ2tIaZ3c8RXkQBieoG/t5BDIv+OTqxY9IB563wFbNS6S+U/v28cRX+aQcp9NsNb7mzgMc
	Jxo7VUKMOGVffK5NFx3uBI8er15BrDO3MozXCFldvbF3hS7hEcFaYqoIhdhZpuLjAhyzCLn7FgHUA
	LkALRrjEc19l+94aYMMFtdmBCfAHqg1cHE0VYxP/qvOCJvmah1ESeG6WYP3gz5MmXsMmSqwAYIivB
	kYuijPHCrzyYzhXKZmgliyF0G8TYHCu1wFq69agg2Lz196S73C37KqqrWwkehSEQORGlIlsSZBgDb
	1gSa7rIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQj54-00000003SQN-3RPt;
	Tue, 10 Nov 2026 10:27:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQj52-00000003SPn-0BTI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 10:27:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FD531516;
	Tue, 10 Nov 2026 02:27:50 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A12A3F85F;
	Tue, 10 Nov 2026 02:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794306473; bh=h8QVGE2a8BaTvad9cRrQL3prndITmd2HwMRRAfN5+/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dhO40is0FGV6jMBwBRZCCuFb7BdEPIbAic0Nii6l/ItyAeUNo9kBIH1g21Ecla85e
	 TXv87uU9PTKJPDv9/j15VoYTdRJqlkBRsXd+AA1SzT4nwh8BJW+P55YW8zen6rjJvC
	 2Y3cWo1tQ9RsCbmPGDSU8YMNsGhaikrUYGImkpD4=
Date: Tue, 10 Nov 2026 10:27:49 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>,
	Bartosz Golaszewski <brgl@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/11] firmware: arm_scmi: stop reading past
 PINCTRL_LIST_ASSOCIATIONS replies
Message-ID: <avLxpUd6cXuqUCbd@pluto>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-5-52d92843ad97@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-5-52d92843ad97@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_022756_173528_7832F169 
X-CRM114-Status: GOOD (  22.82  )
X-Spam-Score: -4.4 (----)
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

On Fri, Oct 30, 2026 at 04:58:36PM +0100, Clément Le Goffic wrote:
> The transport cuts a reply larger than the receive buffer, but the iterator
> still reads every identifier the reply announces. Use only the identifiers
> that were copied and ask again for the others.

Hi Clement,

thanks for these fixes...I'll start from this since it really intersects
my current work....

> 
> Fixes: 2145af01b9cb ("firmware: arm_scmi: Add basic support for SCMI v3.2 pincontrol protocol")
> Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
> ---
>  drivers/firmware/arm_scmi/pinctrl.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
> index 42cb1aef1fe1..69645ce73d9d 100644
> --- a/drivers/firmware/arm_scmi/pinctrl.c
> +++ b/drivers/firmware/arm_scmi/pinctrl.c
> @@ -261,10 +261,22 @@ static int iter_pinctrl_assoc_update_state(struct scmi_iterator_state *st,
>  					   const void *response, void *priv)
>  {
>  	const struct scmi_resp_pinctrl_list_assoc *r = response;
> +	unsigned int nr_fit = 0;
>  
>  	st->num_returned = RETURNED(r->flags);
>  	st->num_remaining = REMAINING(r->flags);
>  
> +	if (st->rx_len > sizeof(*r))
> +		nr_fit = (st->rx_len - sizeof(*r)) / sizeof(r->array[0]);

As Sashiko kindly pointed out to me a few other zillion times O_o in my
Telemetry series, there were a couple of missing sanity checks in the
iterators core so in my last series there is upfront a generic fix

https://lore.kernel.org/arm-scmi/avLTkAtQQSzpgu2A@pluto/T/#me258191dd55db99d53b570be7c51901c31bc70cf

...so we could at least avoid to check here and everywhere else in SCMI
iterators that you have at least a minimum size messages to work on.

> +
> +	if (st->num_returned > nr_fit) {
> +		if (!nr_fit)
> +			return -EPROTO;

My core fix above will discard the iteration upfront in an equivalent way
to this check togateher with the rx_len check above If I get this wrong...BUT..

> +
> +		st->num_remaining += st->num_returned - nr_fit;
> +		st->num_returned = nr_fit;

...why are you fixing and carry on ?
I dont feel that you can safely proceed at this point by just fixing the
returned and the remaining...

...the check is of course needed, but it should be an hard check

	if (st->rx_len < (sizeof(*r) + sizeof(r->array[0]) * st->num_returned))   
                return -EINVAL;

...because something is clearly wrong...indeed, learning from my current
telemetry madness the above scenario could be due not only to a buggy FW
BUT more easily to a misconfigured transport...if the transport size is
misconfigured (as it is mostly NOT negotiated, simply configured) any
message long enough will be silently truncated, so the fact especially
that you guess remaining it can happen to be completely out of sync with
the platform side...

Are you fixing an existent known FW bug here ? in that case I would opt
for a quirk...

Thanks,
Cristian

