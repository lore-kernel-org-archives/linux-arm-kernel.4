Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888A1606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4at/rUXP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iJsa1Ph6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=E4gahwPKY0YwK67Ml2QTBETBsr9zPWMHQsnmRG4ecuk=; b=4at/rUXPcMReHn
	oiJa4PUmNh0WeSvFXcuj17ADr3q/2uMBjWsexuSTSlCZsQdeZP3RGWCAiyClz/OkAi9FdheDTro2b
	1EF9KSSj7NCJjXyeCcSaw+V/BTxL+oL3hdzvkv6Wv5TlANbCuhd00bHTQ+i7McAwXWp1TRnuSFwJW
	WPnjAE34A81qMhpF0vQxt6yfyhcm/TJ1pVQC2YEfJk90cTelnbi5iMzpiryJE3SxptrZ66N/ntbBK
	bmpJqxRQH6DoIHQ3GuuxnLT0dPVfZefJCYRPknX1DpCFCSzngU4bEXEFJtc9iyp88et/HniD+4wy3
	TBGbJdTZyjoYTreBRKyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF3L-0000000ANTE-2mL1;
	Wed, 25 Nov 2026 15:36:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF3B-0000000ANOa-1ZO5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:36:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9FD5563149;
	Wed, 25 Nov 2026 15:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7A81F000D2;
	Wed, 25 Nov 2026 15:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795621008;
	bh=E4gahwPKY0YwK67Ml2QTBETBsr9zPWMHQsnmRG4ecuk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=iJsa1Ph6Lye8Kxltg2vx087a/5J4RHKTfD6GWrcsAiXCLSCCDyc2Osclsbv2u4Gz6
	 gzPl5LIExg0ABFVCuLmjfPIfGu/cr18Twx8HJZ7aOBGG1O5uU05AHowHJMa8XL3hiB
	 Ljdyo+kuWwYcSweCv5J3YItc6gzVJjrrbdUheGDDn3zHz4USa6B3VRvmfAt+PtEQVa
	 LW3kjRPdh8Rem0j8tHFdBtAvDn7aEMW3SR76E61r/KB6s7IvIM6f1xkFiXiILA8DnA
	 v6imJSFC2MKJ0ydJqgl+xvVlFcBxiRBQB1NruNfOTFYzezfdr032SFjR+aQBxCSfdz
	 SCwEhzzppq+dA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 8/8] clk: clocking-wizard: Use separate
 notifier_block for each clock
From: Brian Masney <masneyb@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, git@amd.com, 
 shubhrajyoti.datta@gmail.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261124035613.1968260-9-shubhrajyoti.datta@amd.com>
References: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
 <20261124035613.1968260-9-shubhrajyoti.datta@amd.com>
Date: Wed, 25 Nov 2026 10:36:33 -0500
Message-Id: <179562099317.458327.8068874764407758762.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=2787; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=eaOLuiMerQksPgxnTMm1NlWOcHllakrAf02cjhklA2A=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLZGVoPy995/E0xrb3yToHo+oqub9WRSq65vhmLz0o3W
 iYmaqp0lLIwiHExyIopsizJNSqISF1le++OJgvMHFYmkCEMXJwCMBGFmYwMfdHXd960OcD/NPO4
 9pVHGkVxjO5GB2dwFm2o0Iy3i1vqzchwR4bl/3SRZ2nTHaIk+ZfoXtZ7/iZ1ybtZVd+FJII2sdx
 hBQA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Shubhrajyoti,

> A struct notifier_block has a single 'next' pointer, so registering the
> same instance to two different notification chains corrupts the linked
> lists. Use a dedicated nb_axi for the s_axi_aclk notifier chain.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

Same as previous patch. Needs a Fixes and Cc stable.

> ---
> (no changes since v3)
> 
> Changes in v3:
> - New patch: split the shared notifier_block into per-clock callbacks
>   to avoid corrupting the notifier chains
> 
>  drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 42 +++++++++++++++++-----
>  1 file changed, 33 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> index 046efa5c77c9..f71e464e0fca 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> @@ -133,7 +133,8 @@ enum clk_wzrd_int_clks {
>  /**
>   * struct clk_wzrd - Clock wizard private data structure
>   *
> - * @nb:			Notifier block
> + * @nb:			Notifier block for clk_in1
> + * @nb_axi:		Notifier block for s_axi_aclk
>   * @base:		Memory base
>   * @clk_in1:		Handle to input clock 'clk_in1'
>   * @axi_clk:		Handle to input clock 's_axi_aclk'
> @@ -144,6 +145,7 @@ enum clk_wzrd_int_clks {
>   */
>  struct clk_wzrd {
>  	struct notifier_block nb;
> +	struct notifier_block nb_axi;
>  	void __iomem *base;
>  	struct clk *clk_in1;
>  	struct clk *axi_clk;
> @@ -191,6 +193,7 @@ struct versal_clk_data {
>  };
>  
>  #define to_clk_wzrd(_nb) container_of(_nb, struct clk_wzrd, nb)
> +#define to_clk_wzrd_axi(_nb) container_of(_nb, struct clk_wzrd, nb_axi)
>  
>  /* maximum frequencies for input/output clocks per speed grade */
>  static const unsigned long clk_wzrd_max_freq[] = {
> @@ -1160,6 +1163,30 @@ static struct clk_hw *clk_wzrd_register_divider(struct device *dev,
>  
>  static int clk_wzrd_clk_notifier(struct notifier_block *nb, unsigned long event,
>  				 void *data)
> +{
> +	unsigned long max;
> +	struct clk_notifier_data *ndata = data;
> +	struct clk_wzrd *clk_wzrd = to_clk_wzrd_axi(nb);
> +
> +	if (clk_wzrd->suspended)
> +		return NOTIFY_OK;
> +
> +	max = WZRD_ACLK_MAX_FREQ;
> +
> +	switch (event) {
> +	case PRE_RATE_CHANGE:
> +		if (ndata->new_rate > max)
> +			return NOTIFY_BAD;
> +		return NOTIFY_OK;
> +	case POST_RATE_CHANGE:
> +	case ABORT_RATE_CHANGE:
> +	default:
> +		return NOTIFY_DONE;
> +	}
> +}
> +
> +static int clk_wzrd_clk_notifier_in1(struct notifier_block *nb, unsigned long event,

After this change, clk_wzrd_clk_notifier() and
clk_wzrd_clk_notifier_in1() can be combined with a common helper.

Brian

-- 
Brian Masney <masneyb@kernel.org>

