Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9511606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 19:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xlDeMvjK;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EoGAjdas
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=w3smB/TOMIsBOIa48IJ7JNzgUykCOEbYDqooopA7Cxs=; b=xlDeMvjK76cvxpHZHQxpIMW2Wg
	IURiB9sMLvIW6cNMuyPf+Em/uGsSmTtXNedKAgtKKlakYovy721JnOjNwS4p4nqW/7qln84jPwCTj
	pIqcxbJ4aqBOKgKsZNMqbSbfV34F4FJ7p+W8zxsGNDy0QuID9VUsr8mjrOMdTePEz0I1zkUR3gQVa
	Zt7s5J/Wl4ymrWLl32waiq1bSFXktrQl8fc+8JN4xWfziNYpAGzn2+7pQoOt6Glfn6aeUHVB4ulDY
	QmFZOEOVu+lDyKP4azN1lutU+VYKralsTBm/nLNZXOz+OG7Ku0t7bsg1bc46D4dzzedmQq/Cs1/Xa
	QAW7jjEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWITC-0000000B6ee-1FwW;
	Wed, 25 Nov 2026 19:15:54 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWISv-0000000B6bL-251z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 19:15:39 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso2499422a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 11:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795634136; x=1796238936; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w3smB/TOMIsBOIa48IJ7JNzgUykCOEbYDqooopA7Cxs=;
        b=EoGAjdaseIp8BjmysOQyZcoI2RXELq9mOCD5NFn+YiVrtWTcoYk+Vyy8l00fy4tUNI
         j8MbYls4rnSl3xDf5GVZejw+4Q8EacBq822k4Id4joaSq4zDE+vC5cRROj+/9izXqoOC
         48g3YKAYBpVT8QGwuL4nbrTQ4u+CL8zIxZ5lw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634136; x=1796238936;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w3smB/TOMIsBOIa48IJ7JNzgUykCOEbYDqooopA7Cxs=;
        b=cT38gDq+r7bvCYL2iObZKpIdAv63kQaogAdh+ItafcZAs3wSEneXlzlsG6e/lp3vO1
         NoG03B7KanWFKHtXc85CnQY+JoSQkUx5oiQ+tM13HftJa4jCDminxI0yoJ8UROtEuUtp
         hYPZ1F9FfHipvWJvcfqdQYqsL6B3/zw3/el2UPAZ4ywj6UQYE0IRb4G4cleE1qCogor6
         05vOYJlOAHUvd5INitWBMNDtkhNsMreAquULGjyP/b/5cuXv3cnQBxhGG1YabE68oDU/
         v6/L91rGL05GVbwK20wxVIcA5s1tIQOjXpLFMFlvrHEgsgRmAAOskOprPg5B13iFwHWH
         MyYw==
X-Forwarded-Encrypted: i=1; AL+hErEYpnYexq1UqI27mDKRs79ybXVGazvPBvwK2Sflq+zf2zMPdC2GNGSVwY8QbDBdZheqSbgkbFlQFrdFIKxiqoPU@lists.infradead.org
X-Gm-Message-State: APuU4Z/zO0bg+LWKObSAJNjkv2JFgJsIaokNQtJRWfVmZaemviIC/rK/
	uHsMVNxVesBDA24Le5QX4GDwe+6FDESXpN5NIpdjpOPRcBmQBoLD08xAwvoZZhj6zQ==
X-Gm-Gg: AZFdTZeCEqSfc7Ds/PCt49I5i4c3QqyHq5JXnTU9sNoZHRtKLwJEGv6Cxo17bAT0ZH0
	/TDjBaVGJ43jEip8/HN8/2/oPllgODkEp0lKdAtnfXc22LTRXzws8rKXDMe5TGSpSSxoYJn8OY/
	MKSxYO5dSdRwSJEtSPwLoNlobA83fvuZUP4esws3pwnmO3/kSB/mCSeQFm0WfLUZiqzehufX3GS
	gefqmJoUn7Zdp10CJaIz5gv9xAi/ecbMITvax42NF4IfusSAIxXapn8R3dvz6UXQiGNUB9Shzw2
	rd/3cKJdrj7pZ+wh0vUCmS/BG0hwY+OjEp8ofUhec9Tx2VpN0Efsm2Wn/FHaLCTi1i+Fd6ok8ri
	Fr2r5cyWgz1l+ALE3tqvYIGNB1aQGKLKd6+EzTedzQOmZ/5pedegQs2ffWGqGRa22p1KlTHVm1+
	r+xvXth5JXMbAyznnKDxA1ffEaq6p/bVYst8hjlNveX56vncBKs+flR8llv4wdron+nPk3DNyMu
	MVypTs5IzWpmF/KAbaNsrWTwImRCcHZWte+zO2/LCVJwIOGIxIvJIfkbM67ciYz5NC/HSidzx+C
	NCg1g+Dv+CaqY4J3BxllDb3nDHQTGTuBm0NOTW9UhylvmiDcn5pU47ezHFXIjDNgQqE=
X-Received: by 2002:a17:90b:442c:b0:3ac:a203:e0a1 with SMTP id 98e67ed59e1d1-3b41c92a902mr18354355a91.37.1795634136385;
        Wed, 25 Nov 2026 11:15:36 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:d0a2:f616:6ba:a1ce])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-cde6d05782asm9164989a12.24.2026.11.25.11.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:15:35 -0800 (PST)
Date: Wed, 25 Nov 2026 11:15:33 -0800
From: Brian Norris <briannorris@chromium.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>,
	linux-clk@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	Mariano Marciello <mmarciello@google.com>,
	google-soc@lists.linux.dev
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
Message-ID: <awcz1aP6xcL6G2t4@google.com>
References: <20261125000349.3385325-1-briannorris@chromium.org>
 <20261124160343.v2.5.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
 <f89e293688feb3f9bcdce0f1b6fed0ee424e5cd8.camel@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f89e293688feb3f9bcdce0f1b6fed0ee424e5cd8.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_111537_586384_AE011D7E 
X-CRM114-Status: GOOD (  38.10  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 09:48:04AM +0100, Philipp Zabel wrote:
> On Di, 2026-11-24 at 16:03 -0800, Brian Norris wrote:
> > Google Tensor SoCs (used on Pixel phones) manage many resources
> > (including resets) using a Central Power Manager (CPM) co-processor. We
> > communicate with CPM using mailboxes, abstracted in the
> > devm_cpm_get_handle(), etc., API.
> > 
> > For posterity, I list a summary of changes made relative to the
> > downstream Pixel driver:
> > 
> > * Switch to auxiliary bus, as a child of a CPM device
> > 
> > * Use devm more heavily
> > 
> > * Avoid representing each reset as its own Device Tree node.
> > 
> > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > ---
> > 
> > Changes in v2:
> >  * Rename symbols from goog_cpm_rst_* to cpm_reset_*
> >  * Moved shared protocol details to CPM driver
> >  * Remove custom reset debugfs interface and .remove callback.
> >  * Remove per-SoC table; we only need naive translation of firmware IDs
> > 
> >  drivers/reset/Kconfig            |   1 +
> >  drivers/reset/Makefile           |   1 +
> >  drivers/reset/google/Kconfig     |  11 +++
> >  drivers/reset/google/Makefile    |   2 +
> >  drivers/reset/google/reset-cpm.c | 154 +++++++++++++++++++++++++++++++
> >  5 files changed, 169 insertions(+)
> >  create mode 100644 drivers/reset/google/Kconfig
> >  create mode 100644 drivers/reset/google/Makefile
> >  create mode 100644 drivers/reset/google/reset-cpm.c
> > 
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> > index 673bca1e594e..64c12b479b2c 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -475,6 +475,7 @@ config RESET_ZYNQMP
> >  	  This enables the reset controller driver for Xilinx ZynqMP SoCs.
> >  
> >  source "drivers/reset/amlogic/Kconfig"
> > +source "drivers/reset/google/Kconfig"
> >  source "drivers/reset/hisilicon/Kconfig"
> >  source "drivers/reset/realtek/Kconfig"
> >  source "drivers/reset/spacemit/Kconfig"
> > diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> > index 2fe527a7be8e..a151fe63905e 100644
> > --- a/drivers/reset/Makefile
> > +++ b/drivers/reset/Makefile
> > @@ -1,6 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  obj-y += core.o
> >  obj-y += amlogic/
> > +obj-y += google/
> >  obj-y += hisilicon/
> >  obj-y += realtek/
> >  obj-y += spacemit/
> > diff --git a/drivers/reset/google/Kconfig b/drivers/reset/google/Kconfig
> > new file mode 100644
> > index 000000000000..38431b4f9001
> > --- /dev/null
> > +++ b/drivers/reset/google/Kconfig
> > @@ -0,0 +1,11 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +config RESET_CPM
> > +	tristate "Google CPM Reset Controller"
> > +	depends on ARCH_GOOGLE || COMPILE_TEST
> > +	depends on GOOGLE_CPM_MBA
> > +	help
> > +	  Driver support for reset controllers found on Google Tensor SoCs,
> > +	  operating over the CPM mailbox interface. This allows peripheral
> > +	  drivers to assert and deassert resets on LPCM hardware blocks.
> > +
> > +	  If unsure, say N.
> > diff --git a/drivers/reset/google/Makefile b/drivers/reset/google/Makefile
> > new file mode 100644
> > index 000000000000..437c19459464
> > --- /dev/null
> > +++ b/drivers/reset/google/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +obj-$(CONFIG_RESET_CPM) += reset-cpm.o
> > diff --git a/drivers/reset/google/reset-cpm.c b/drivers/reset/google/reset-cpm.c
> > new file mode 100644
> > index 000000000000..ef0863f25cac
> > --- /dev/null
> > +++ b/drivers/reset/google/reset-cpm.c
> > @@ -0,0 +1,154 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Device driver to control Google SoC LPCM resets via CPM.
> > + * Copyright 2023-2026 Google LLC
> > + */
> > +
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/container_of.h>
> > +#include <linux/dev_printk.h>
> > +#include <linux/device.h>
> > +#include <linux/err.h>
> > +#include <linux/errno.h>
> > +#include <linux/gfp_types.h>
> > +#include <linux/limits.h>
> > +#include <linux/mod_devicetable.h>
> 
> Please include the specific <linux/device-id/*.h> that is needed
> instead of all of <linux/mod_devicetable.h>.

Ack.

> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/reset-controller.h>
> > +#include <linux/types.h>
> > +#include <soc/google/google-cpm-mba.h>
> > +
> > +#define ASSERT_OP_ID			0
> > +#define DEASSERT_OP_ID			1
> > +
> > +#define CPM_RST_LPCM_ID_MASK		GENMASK(31, 16)
> > +#define CPM_RST_ID_MASK			GENMASK(15, 0)
> 
> Why are these fields 16 bits wide when one line below it says:

Poor code evolution, as the bindings changed, and the field width became
more explicit here. Sorry I missed this.

I'm thinking I'll shrink the above to 8 bits, and use FIELD_MAX(*_MASK)
for validation instead of CPM_RST_ID_MAX.

> > +/* Object fields are 8 bits */
> > +#define CPM_RST_ID_MAX			U8_MAX
> > +
> > +static inline unsigned long to_rstc_idx(u32 lpcm_id, u32 rst_id)
> > +{
> > +	return FIELD_PREP(CPM_RST_LPCM_ID_MASK, lpcm_id) |
> > +	       FIELD_PREP(CPM_RST_ID_MASK, rst_id);
> > +}
> > +
> > +static inline u32 lpcm_from_idx(unsigned long idx)
> > +{
> > +	return FIELD_GET(CPM_RST_LPCM_ID_MASK, idx);
> > +}
> > +
> > +static inline u32 rst_from_idx(unsigned long idx)
> > +{
> > +	return FIELD_GET(CPM_RST_ID_MASK, idx);
> > +}
> > +
> > +struct cpm_reset_provider {
> > +	struct reset_controller_dev rcdev;
> > +	struct cpm_handle *cpm;
> > +};
> > +
> > +static inline struct cpm_reset_provider *to_provider(struct reset_controller_dev *rcdev)
> > +{
> > +	return container_of(rcdev, struct cpm_reset_provider, rcdev);
> > +}
> > +
> > +static int cpm_reset_send_lpcm(struct reset_controller_dev *rcdev,
> > +			       unsigned long idx, u8 opcode)
> > +{
> > +	struct cpm_reset_provider *provider = to_provider(rcdev);
> > +	const struct cpm_lpcm_message msg = {
> > +		.cmd = LPCM_CMD_SET_RST,
> > +		.opcode = opcode,
> > +		.lpcm_id = lpcm_from_idx(idx),
> > +		.obj_id = rst_from_idx(idx),
> > +	};
> > +
> > +	return cpm_send_lpcm_message(provider->cpm, &msg);
> > +}
> > +
> > +static int cpm_reset_assert(struct reset_controller_dev *rcdev,
> > +			    unsigned long idx)
> > +{
> > +	return cpm_reset_send_lpcm(rcdev, idx, ASSERT_OP_ID);
> > +}
> > +
> > +static int cpm_reset_deassert(struct reset_controller_dev *rcdev,
> > +			      unsigned long idx)
> > +{
> > +	return cpm_reset_send_lpcm(rcdev, idx, DEASSERT_OP_ID);
> > +}
> > +
> > +static const struct reset_control_ops cpm_reset_ops = {
> > +	.assert = cpm_reset_assert,
> > +	.deassert = cpm_reset_deassert,
> > +};
> > +
> > +static int cpm_reset_of_xlate(struct reset_controller_dev *rcdev,
> > +			      const struct of_phandle_args *reset_spec)
> > +{
> > +	u32 lpcm_id, rst_id;
> > +
> > +	if (reset_spec->args_count != 2)
> > +		return -EINVAL;
> > +
> > +	lpcm_id = reset_spec->args[0];
> > +	rst_id = reset_spec->args[1];
> > +
> > +	if (lpcm_id > CPM_RST_ID_MAX)
> 
> This looks a bit weird.
> 
> Maybe add a CPM_LPCM_ID_MAX, directly use U8_MAX here, or rename the
> constant to not include RST_ID?

How about these (with the masks made 8-bit as they should be)?

  FIELD_MAX(CPM_RST_LPCM_ID_MASK))
  FIELD_MAX(CPM_RST_ID_MASK))

Or else maybe just U8_MAX.

> > +		return -EINVAL;
> > +	if (rst_id > CPM_RST_ID_MAX)
> > +		return -EINVAL;
> > +
> > +	return to_rstc_idx(lpcm_id, rst_id);
> > +}
> > +
> > +static int cpm_reset_probe(struct auxiliary_device *auxdev,
> > +			   const struct auxiliary_device_id *id)
> > +{
> > +	struct device *dev = &auxdev->dev;
> > +	struct cpm_reset_provider *provider;
> > +	int ret;
> > +
> > +	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
> 
> devm_kzalloc_obj()

Ack.

> > +	if (!provider)
> > +		return -ENOMEM;
> > +
> > +	provider->cpm = devm_cpm_get_handle(dev);
> > +	if (IS_ERR(provider->cpm))
> > +		return dev_err_probe(dev, PTR_ERR(provider->cpm),
> > +				     "Failed to get CPM handle\n");
> > +
> > +	provider->rcdev.dev = dev;
> > +	provider->rcdev.owner = THIS_MODULE;
> > +	provider->rcdev.of_node = dev->of_node;
> > +	provider->rcdev.ops = &cpm_reset_ops;
> > +	provider->rcdev.of_reset_n_cells = 2;
> > +	provider->rcdev.of_xlate = cpm_reset_of_xlate;
> > +
> > +	ret = devm_reset_controller_register(dev, &provider->rcdev);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to register reset controller: %d\n", ret);
> 
> dev_err_probe()

Ack.

Regards,
Brian

