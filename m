Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E0D606A337
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 19:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R4DxIwMu;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YTwPbgLG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oRymF9g7Ou6E84Fcm6RvQE44N4Aj97+O2QyjNvisAjA=; b=R4DxIwMuu5DU1qgj+z9gxRuGRA
	Em+sNgBQ9ecljQsmUd2leqX9u66oHHCF7zI3wiLaynQX0KDQqswuMH3EpvA8FRChSCkM2gSG0UOiJ
	rdTb2i0+A4Y5SiHxLt0TauZj/Z82nbB9HX9s6Wa2dYNL/4a+errjgi906HI9foyoQsHd7ev+9BivO
	FzlVpaTTwj0kAhUYQESzDEy4nZ+UjsQpf2A/13woYMdIHDC8JW225/nxbcbbuYDy/S1G630zCC6e6
	RdTK8UZ3DTRQv94Icbt01h1qbw39LdZn2gUiJiRVRv2+RKzV53xiIH22XFdNd+q7McNPnV4v+T3G/
	0IOIvsYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvpb-00000007ZAa-3w8z;
	Tue, 24 Nov 2026 19:05:31 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvpZ-00000007ZAE-0MhR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 19:05:30 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-1b3ada81853so5679189c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 11:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795547127; x=1796151927; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oRymF9g7Ou6E84Fcm6RvQE44N4Aj97+O2QyjNvisAjA=;
        b=YTwPbgLG38xCWTZGG7wTr445IUUmD8CVWnTGHXjT0jr73E6pybD5cPJ9fH1I4nNIM3
         HtkCkkqTNPkL9Z91DO6s6J4v82AQdod/PEX5NUxewL/tu7oetVLcK5neZ4r30tS8hiF5
         PYWsF6pN6WaLDZLtjIQE4+3bq/SmD6Ya4azMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795547127; x=1796151927;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oRymF9g7Ou6E84Fcm6RvQE44N4Aj97+O2QyjNvisAjA=;
        b=v3d6vXoiOUAAMOPeXlEJekU9XLKO6qBhaeX82+rE6A8/LoVFGYwh8RkJXMnOwqWyYl
         XxMzXSefrJqjNn1+GbKUJQWjQDO/RAdhpYFjBkawzHLndTDwq6g4duhA7cSNu1dK3t9k
         OJGpSHbp07otytrvNIHl3YY17WcTqhsGENny5NpdazHUmo+BNrHIF/roaVlJnRBEYg3m
         ur2YcAiJH8O62gTj+uLY56QBHowcFoohQOKAgthODID4cHK/jm9XNuT0sjP4bPGOErJ8
         /CMHchHQxTAGumAAQJ4zgirRx/LFjhiwc5OLs1I4zyL6UKKYry94m8ldgL1EwTDgUM7p
         uf5g==
X-Forwarded-Encrypted: i=1; AL+hErHSr7OBxiYobZHp5r6tDcvQc3inSBh68nRNa9Kig2nQpPoHnKt0zSAMDN4Tv1cszqSIy/EHx14RjiV2L7yN0+ET@lists.infradead.org
X-Gm-Message-State: APuU4Z/Tj2qomCgotjrmaJ4a0gFHLDbGnzIrkoOMOWX64yBvGugI6XzD
	SJjSRG9gUS9sJ9opwcBslq40Jn+Inq5APMRXT3oRNZZpWODDVmhNDo6VS9Cl0FupJQ==
X-Gm-Gg: AZFdTZcerVIxoul0QhgPN4hSTtUFfJO70Qb7OYKPQ9PfmBihN79+wgoJdVtBXeZhYcG
	63nolhvvXjpJ0x/s/imO7xE2Hw+AUDfada48x6B4yI7PU2FqghqEJNveEOu0kUuM2Is8V1wntda
	vmTFz7pUnO7Fso0+Ywft2hzgGrQtgiAeybngpcJqc9+63q7BeI/pB/lAIZxPXrQh56GfC726QqM
	VXs4F5SseAJICz1m3dHAB1FacZ717g9TSV3TcFDSo1yOGKAPsC8FDombT8h14/w8X3ggwm9OzJx
	IOgb7SDBOCltGua3CUyfakHgNCkIB3SRqAWbDuHxtLssQ8tHsmslHxUj93QHOECGTaL+ozUwP7j
	ImdChBEq4nN2berzErjGRPV5i8B6IHH+OXgLu6V17rtQwnB2Vvc+zt3RJBJy6SodYipZrCuM2sL
	Ji7hNPPMeccxlh/AveR66h2CKmQ6y89/VbE/8erzAAy8uUTHO6aM7QwCV6jNFcyMqdTPXJ+cVQ6
	EjCKj0MKUDQ/Bhlj+WTR6I9qVVflyu0+w0dAWv94p09+zvJ7DghvQa32pY0xYGCBr3SZTHUQEm0
	K9yywYXVrh6IQ0Kc8STM24PcEAUSYRqzhqyAcIGRis1wIADPJn8zJA2LY0e2XXsNP7Dh
X-Received: by 2002:a05:7023:a41:b0:1b5:4b48:b9ee with SMTP id a92af1059eb24-1b5568c0ec9mr15438832c88.26.1795547127198;
        Tue, 24 Nov 2026 11:05:27 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3866f299d0bsm39337143eec.19.2026.11.24.11.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 11:05:26 -0800 (PST)
Date: Tue, 24 Nov 2026 11:05:23 -0800
From: Brian Norris <briannorris@chromium.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 3/9] soc: google: Add CPM over MailBox Array driver
Message-ID: <awXf86suGgKeazZx@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
 <CADrjBPqnRrFeYT9J6NGxy+Xzy1PTZEz+BMs1_u2md7Ra6xPPDQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADrjBPqnRrFeYT9J6NGxy+Xzy1PTZEz+BMs1_u2md7Ra6xPPDQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_110529_178037_27935CB6 
X-CRM114-Status: GOOD (  42.25  )
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

On Tue, Nov 24, 2026 at 12:28:24PM +0000, Peter Griffin wrote:
> Hi Brian,
> 
> Thanks for your series; it's great to see more Laguna support being posted.
> 
> On Mon, 26 Oct 2026 at 21:45, Brian Norris <briannorris@chromium.org> wrote:
> >
> > The Central Power Manager (CPM) is a co-processor on the Google Tensor
> > SoCs, as used on Pixel phones. CPM supports power-management and a
> > number of other features.
> >
> > The Application Processor communicates with CPM over a pair of mailbox
> > channels (the "MailBox Array" (MBA)). CPM provides clock, power-domain,
> > reset, interrupt services, and more.
> 
> [..]
> 
> +++ b/drivers/soc/google/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config GOOGLE_CPM_MBA
> +       tristate "Google Tensor CPM MailBox Array Interface"
> +       depends on ARCH_GOOGLE || COMPILE_TEST
> +       depends on MAILBOX
> 
> Should we also have "depends on OF"?

Why, precisely? It's not actually a compilation dependency (I tested),
although it's needed at runtime. It doesn't seem like this is
consistently done simply for runtime dependencies, and instead work has
generally been done to ensure everything builds fine and fails closed
without CONFIG_OF.

Anyway, it's a bit academic, since ARCH_GOOGLE (ARM64) selects OF.

> +       select AUXILIARY_BUS
> +       help
> +         Driver for interfacing with the Central Power Manager (CPM) MailBox
> +         Array (MBA) found on Google Tensor SoCs. The driver provides APIs for
> +         communication between the Application Processor and the CPM, and
> +         is required by CPM client drivers such as clock, reset, power
> +         domain, and more.
> 
> > diff --git a/drivers/soc/google/google-cpm-mba.c b/drivers/soc/google/google-cpm-mba.c
> > new file mode 100644
> > index 000000000000..629a071e202c
> > --- /dev/null
> > +++ b/drivers/soc/google/google-cpm-mba.c
> > @@ -0,0 +1,964 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Google MailBox Array (MBA) CPM Interface
> > + *
> > + * Copyright 2023-2026 Google LLC
> > + */
> > +
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/cleanup.h>
> > +#include <linux/completion.h>
> > +#include <linux/device.h>
> > +#include <linux/jiffies.h>
> > +#include <linux/kref.h>
> > +#include <linux/list.h>
> > +#include <linux/lockdep.h>
> > +#include <linux/mailbox/goog-mba-message.h>
> > +#include <linux/mailbox_client.h>
> > +#include <linux/mailbox_controller.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/spinlock.h>
> 
> Missing `#include <linux/slab.h>` header here as later it calls
> kfree(), kzalloc_obj().
> This can cause "implicit declaration of function kfree / kzalloc_obj"
> errors with COMPILE_TEST. Also similar issue in clk-cpm.c

Ack, will fix.

> > +
> > +#include <soc/google/google-cpm-mba.h>
> > +
> > +#include "google-cpm-mba.h"
> > +
> 
> [..]
> > +static bool cpm_iface_is_valid_req(struct cpm_data *cpm,
> > +                                  struct cpm_request *cpm_req)
> > +{
> > +       struct device *dev = cpm->dev;
> > +
> > +       if (!cpm_req) {
> > +               dev_err(dev, "cpm_req is NULL\n");
> > +               return false;
> > +       }
> > +
> > +       if (!cpm_req->req_msg) {
> > +               dev_err(dev, "cpm_req->req_msg is NULL\n");
> > +               return false;
> > +       }
> > +
> > +       if (cpm_req->msg_type > RESPONSE_MSG || cpm_req->msg_type < ONEWAY_MSG) {
> > +               dev_err(dev, "Invalid msg_type: %d\n", cpm_req->msg_type);
> > +               return false;
> > +       }
> 
> Should cpm_req->dst_id also be range checked?

This will be refactored on v2, where dst_id will be u8 and so will
always be in-bounds.

> > +
> > +       if (cpm_is_request_msg(cpm_req) && !cpm_req->resp_msg) {
> > +               dev_err(dev, "cpm_req->resp_msg is NULL when msg_type is REQUEST_MSG\n");
> > +               return false;
> > +       }
> > +
> > +       if (cpm_is_response_msg(cpm_req)) {
> > +               if (!goog_mba_q_get_valid(&cpm_req->resp_context)) {
> > +                       dev_err(dev, "Invalid valid bit in resp_context: %#x\n",
> > +                               cpm_req->resp_context);
> > +                       return false;
> > +               }
> > +
> > +               if (!cpm_is_response_header(&cpm_req->resp_context)) {
> > +                       dev_err(dev, "Invalid response type in resp_context: %#x\n",
> > +                               cpm_req->resp_context);
> > +                       return false;
> > +               }
> > +       }
> > +
> > +       return true;
> > +}
> > +
> 
> [..]
> 
> > +
> > +static int cpm_init_q_mode_proto(struct cpm_data *cpm)
> > +{
> > +       struct cpm_payload msg_payload = {};
> > +       struct cpm_request req = {
> > +               .msg_type = ONEWAY_MSG,
> > +               .req_msg = &msg_payload,
> > +       };
> > +
> > +       return __cpm_send_message(cpm, &req, GOOG_MBA_Q_INIT_PROTO_VAL, 0);
> 
> Do we want this to have an infinite timeout? If the CPM firmware never
> responds, it will hang the boot (as MAX_SCHEDULE_TIMEOUT doesn't arm a
> timer).
> I guess it is game over anyway if the CPM firmware is dead, but it
> would be nice to log an error and return from probe()

Hmm, I suppose a timeout would be OK, although definitely fatal to any
useful purpose of the system.

> > +}
> > +
> > +static int cpm_init_q_mode(struct cpm_data *cpm)
> > +{
> > +       int ret;
> > +
> > +       ret = cpm_init_q_mode_proto(cpm);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       cpm->seq_num = GOOG_MBA_Q_MIN_SEQ_VAL;
> > +
> > +       return 0;
> > +}
> > +
> > +static void cpm_adev_release(struct device *dev)
> > +{
> > +       struct auxiliary_device *adev = to_auxiliary_dev(dev);
> > +
> > +       of_node_put(dev->of_node);
> > +       kfree(adev);
> > +}
> > +
> > +static void cpm_unregister_adev_action(void *data)
> > +{
> > +       struct auxiliary_device *adev = data;
> > +
> > +       auxiliary_device_delete(adev);
> > +       auxiliary_device_uninit(adev);
> > +}
> > +
> 
> Can we use devm_auxiliary_device_create() instead of open coding these?

Yes.

I think this (and some planned subsequent changes) have morphed a bit
over my development time, as there were some cases where we could not
reuse the same of_node. But this current patch can use it, and I also
think future changes will likely just use mfd / of_platform_populate()
if they require subnodes, so my initial concern is probably invalid.

> > +static int cpm_register_adev(struct cpm_data *cpm, const char *name)
> > +{
> > +       struct auxiliary_device *adev;
> > +       int ret;
> > +
> > +       adev = kzalloc_obj(*adev, GFP_KERNEL);
> > +       if (!adev)
> > +               return -ENOMEM;
> > +
> > +       adev->name = name;
> > +       adev->id = 0;
> > +       adev->dev.parent = cpm->dev;
> > +       adev->dev.release = cpm_adev_release;
> > +       device_set_of_node_from_dev(&adev->dev, cpm->dev);
> > +
> > +       ret = auxiliary_device_init(adev);
> > +       if (ret) {
> > +               of_node_put(adev->dev.of_node);
> > +               kfree(adev);
> > +               return ret;
> > +       }
> > +
> > +       ret = auxiliary_device_add(adev);
> > +       if (ret) {
> > +               auxiliary_device_uninit(adev);
> > +               return ret;
> > +       }
> > +
> > +       return devm_add_action_or_reset(cpm->dev, cpm_unregister_adev_action, adev);
> > +}
> > +
> 
> [..]
> 
> > +
> > +MODULE_DESCRIPTION("Google MBA CPM interface");
> > +MODULE_AUTHOR("Lucas Wei <lucaswei@google.com>");
> 
> I think you should add Lucas Wei's SoB tag to the patch as part of the DCO

I keep going back and forth in my head on this one, since these drivers
did indeed start from the same source with the professed MODULE_AUTHOR.
But they've been massively rewritten, so they're similar in a sort of
Ship of Theseus way.

I suppose I'll retain the MODULE_AUTHOR() and update the SoB.

Regards,
Brian

