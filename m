Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768DA606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 06:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M8hnMKcq;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dOMkWo0d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=s5PlVsi6j4PvwLFvzjlO8NbEFYTNc4HGfVml1EHrjaA=; b=M8hnMKcqWNYGOu79spvRuxbCWj
	jwHu+JykXELOxpEFG2iABX2EmYc1bLgSPQHLyJq9dRxYRFp1kcxotIhV0WRRV1gTN/0urkhDcMPnL
	mQiIQMuTcX7Fk8YbljjGIKgv5MG4rrbkFawiwnIpxPmouB1D0UGM+k4io7aatlnQmSRhGIJdwnk8S
	cmHMer3quQjQnX4kGof8rqUg4vxrCo5vHgUOe/jewGpknlgqcuKapt3E3uqKko2aaP4PHXPLhJkti
	dlYTEZoEYpOJJqUUCIEGWNSDSZawjIwViYIPmU6omQiAK3neTsWsksIjtGiYD+7qFizWbUzL+wPXp
	ak1LUEfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Q2-00000008evP-1xBM;
	Wed, 25 Nov 2026 06:23:50 +0000
Received: from out-152.mta1.migadu.com ([95.215.58.152] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Ps-00000008eu9-2nw5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 06:23:42 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=y3jaNmWJOqYutmStsJnp8wnWyR5lazjqbdgklsvcTjE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795587817; v=1; x=1796192617;
 b=dOMkWo0d8gIR5V+S8JNxea0btYSs2W7dv1iQsDXKmQWAuokF4ruaE8AussKZ5h4RlBEimGjC
 pakPKqptB/Oc2x0CK5dQJETwixSy1kb/lYAnTWLm7FAn+Cxer8CVYl1q2QpUGAJPLyIHMD/5QKi
 JPzhrU2ylRf378a/D2Wtg6Aw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2629535c16105de2;
	Wed, 25 Nov 2026 06:23:37 +0000
X-Mizu-Trace-ID: 2629535c16105de2
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 07:23:34 +0100
From: Richard Leitner <richard.leitner@linux.dev>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Lee Jones <lee@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 05/10] remoteproc: imx_rproc: Avoid stale mailbox
 pointers on request failure
Message-ID: <awZ-XC1efo5QQvNI@bombadil>
References: <20261123172140.3547896-6-lee@kernel.org>
 <20261124032344.5314-1-peng.fan@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261124032344.5314-1-peng.fan@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_222341_420025_80121240 
X-CRM114-Status: GOOD (  24.98  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lee, Hi Peng,

On Tue, Nov 24, 2026 at 11:23:41AM +0800, Peng Fan (OSS) wrote:
> Hi Lee,
> On Mon, 23 Nov 2026 17:20:49 +0000 Lee Jones <lee@kernel.org> wrote:
> 
> > imx_rproc_xtr_mbox_init() stores the result of
> > mbox_request_channel_byname() directly into priv->tx_ch and priv->rx_ch.
> > Because mailbox channels are freed on stop() and detach() and
> > re-requested on start(), attach(), and system shutdown, a failure while
> > requesting "tx" leaves an ERR_PTR in priv->tx_ch, which is later
> > dereferenced by imx_rproc_kick() and imx_rproc_free_mbox().  If "rx"
> > fails after "tx" succeeds, priv->tx_ch is freed without being cleared
> > while priv->rx_ch retains an ERR_PTR, causing subsequent calls to see
> > both pointers as non-NULL and skip initialisation, leading to a
> > use-after-free on priv->tx_ch and an ERR_PTR dereference on priv->rx_ch.
> > 
> > Request both channels into local variables and assign priv->tx_ch and
> > priv->rx_ch only after both requests succeed.
> 
> I think Richard Leitner <richard.leitner@linux.dev> is working on this.
> 
> https://lore.kernel.org/linux-remoteproc/CANLsYkx=M_TXN10qAcQC0be065TYnzfOae6E8ss-9DTj9MzogA@mail.gmail.com/T/#ma2f8e4c332d47e5bdd1787f82f4dd2feeafc67d6

AFAICT my series fixes a similar, but other problem. Mine is about the
free'ing order and a possible race when a kick occurs during
cleanup/close. This one is targeted towards the setup/initialisation.
Therefore IMHO this is a valid, fix for a different problem than mine.

What's your opinion on this Lee?

reagards;rl

> 
> Regards
> Peng
> 
> > 
> > Fixes: 99b142cf7191 ("remoteproc: imx_rproc: Request mbox channel later")
> > Closes: https://sashiko.dev/#/bug/linux-ac0f248a-bdfd-41da-95f8-44b8f1f7091d
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lee Jones <lee@kernel.org>
> > ---
> >  drivers/remoteproc/imx_rproc.c | 18 +++++++++++-------
> >  1 file changed, 11 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > index 581bb07f5893..a77a3342e1ed 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -875,6 +875,7 @@ static void imx_rproc_rx_callback(struct mbox_client *cl, void *msg)
> >  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
> >  {
> >  	struct imx_rproc *priv = rproc->priv;
> > +	struct mbox_chan *tx_ch, *rx_ch;
> >  	struct device *dev = priv->dev;
> >  	struct mbox_client *cl;
> >  
> > @@ -900,18 +901,21 @@ static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block)
> >  	cl->knows_txdone = false;
> >  	cl->rx_callback = imx_rproc_rx_callback;
> >  
> > -	priv->tx_ch = mbox_request_channel_byname(cl, "tx");
> > -	if (IS_ERR(priv->tx_ch))
> > -		return dev_err_probe(cl->dev, PTR_ERR(priv->tx_ch),
> > +	tx_ch = mbox_request_channel_byname(cl, "tx");
> > +	if (IS_ERR(tx_ch))
> > +		return dev_err_probe(cl->dev, PTR_ERR(tx_ch),
> >  				     "failed to request tx mailbox channel\n");
> >  
> > -	priv->rx_ch = mbox_request_channel_byname(cl, "rx");
> > -	if (IS_ERR(priv->rx_ch)) {
> > -		mbox_free_channel(priv->tx_ch);
> > -		return dev_err_probe(cl->dev, PTR_ERR(priv->rx_ch),
> > +	rx_ch = mbox_request_channel_byname(cl, "rx");
> > +	if (IS_ERR(rx_ch)) {
> > +		mbox_free_channel(tx_ch);
> > +		return dev_err_probe(cl->dev, PTR_ERR(rx_ch),
> >  				     "failed to request rx mailbox channel\n");
> >  	}
> >  
> > +	priv->tx_ch = tx_ch;
> > +	priv->rx_ch = rx_ch;
> > +
> >  	return 0;
> >  }
> >  
> > -- 
> > 2.56.1.750.gf70dc682cf-goog
> 
> Sent using hkml (https://github.com/sjp38/hackermail)

