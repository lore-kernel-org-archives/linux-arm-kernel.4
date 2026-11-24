Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3CD606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 12:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ePwI9470;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dwm44Ga+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bWdHkD13wMd/Xd77WjepXEVBI/YLkHIIzGDJnSOi/6c=; b=ePwI9470vcWwvBZysn+Zvlwcjs
	6E28oyfeehpszx6y9fWOi6d05PlkcQT+FkfYBRCYUywlWXOU2EL5EQ3M6uXkUXgbqfqnSqMaJPA4a
	e5ZwkBzayFOo9/mQqQqfrkA5KftgH97IAl0wHHCym7SyoYIPRH5Sh+879ZOHVh8Cn3mdkPUIq1x7Y
	FvsD2HCC5iVvyPBXKB1hA0bWItCVYjjmRqZbX/OTjVGlTMj/oYPU7RPOWH+HYFYGQKhrqv3lunp6s
	zBK2N6J/7+qkBfnTirp4uuvZdkjYH11Qp6RXToewJ7trbkmF2PmyX46LO+rlGNCt0GKfGoFL3whXN
	YNz3mo5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpdZ-00000006VqP-18RH;
	Tue, 24 Nov 2026 12:28:41 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpdW-00000006Vq1-1fxA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 12:28:39 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6bab10842f8so3742544a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 04:28:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795523316; cv=none;
        d=google.com; s=arc-20260327;
        b=ADmdb520gJZDhDTMR0T6wSQ2hXuJvTtHnlmtzHaPDj0s73wz6mN8Mg7JxfYIUrOV0A
         xdDopDFz+RTuiX2lFA1cpMhq9LxRR0s5fR5A13zwNL4XJtZKLnRfaIDW2TCq9LNQYAoW
         7L5GfmwdD0VJAgIoPwBTpAzAJstRC3MZTHFYh9mydMIcNLXq5pndoXe+1WEbg4SbBNo/
         2nBB+FKw14YblShOTRHNY/MdTFaGkYT7EAVIo1cHhxp4F+hua6DLwb7zHFL8Ze/sBVzP
         2IQUTIMLZUqvFP3YRhz2DAWFaFa9jKuw3Dm7gpwD84EfCflArqBk2se5SvuN6C++aoWJ
         s5Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bWdHkD13wMd/Xd77WjepXEVBI/YLkHIIzGDJnSOi/6c=;
        fh=RGUxMEsIZTFFTfcEB1XyJL6jTtLHsSVj70UdwkdPFeI=;
        b=djHIAFmxTaiCBJaqfpo3Bb+mU2olhL6VDOl5CSZXq+cuVLHAVjXjOV26uCLr6DTgIE
         2kJZibZWg/D18w0/3hBt5Rz7HU8yOcU4czm0vcMf3MqXDsxt36YjmyiNfex34aWo4Ksg
         AHgCzzHp2/AG7kpH+HvY9aiyaFB9eINFi8LmxpgF8Jt++VXdo1Qu5pusLGmLkzqGfxY4
         AOXuhse6I2RzYVvCvDGUzjxGhj6tnWOavcE3FbY72A45FhlNBozCx+ViqJ0TG2uEWLq6
         Ry0OXqNojmb3AaRhqtBsZGq83tn3efIi12/vABsOsCD/ZZ/Sxw3jw6TcbA4ioSwDM50R
         vUzQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795523316; x=1796128116; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWdHkD13wMd/Xd77WjepXEVBI/YLkHIIzGDJnSOi/6c=;
        b=dwm44Ga+pWJfLXXKv9ujZqi+Zmzo+f5Zz+Sq/KhLKhodAdvouhHjeHG0mJf3U/WlhN
         0CWw/CerxraqwI07YR/L6ctQB+feLAhZEaSIk4Z0YCq31OC283K562XNTZMVGqYIfKh9
         KQqXZTLSMk+wASRHAKqVq55OZqyhdl/ChnBUu9I4hkq5FhM6PrSEl1fMMt6afw12MhCr
         WsxK1fIUBCC+4mmgscnGbblgcd6puz3Y3f+xNVlqatGIOt2BKuULSCgnoW6x4KyKlgWL
         C1OK7Jar52+1jjoHWmEaH6wy6Cjt0YESyg6SIn6bnViMCKsNZa1B6Fl6rMnXvdaz6Duw
         mK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795523316; x=1796128116;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bWdHkD13wMd/Xd77WjepXEVBI/YLkHIIzGDJnSOi/6c=;
        b=CAhajrFVxhcYvRncL1gq/9baxZ4DBbtjjdZLYbnZsnI5E9du1BFcZYnBPTUsbl46Ii
         v4CxUTiLAFAF1Ups91Jm+n0QAYGdJbRC3KY9bSKbGoNJi+oAiYyF4sp3ZEjJtc79N7Ug
         eyv8UDR5eQwTdR5YWVOr60i9ECpRcddlIoWbSL6/T8/pqJCJoUZk7u1EOUaezfq57iVA
         iZ7pOaC6Gpiidm9Sls6jiqqExw32gz/op1N+pFZUxrtZ2B1fp96IqlSnkDgNvGmAkXLC
         3DQ10Ce2/G2WFnj6F7nncvZmx456Pd5PLPU/DEIl9EcjWaM2xVTR16UXgzk4Kq10f2U4
         ppBA==
X-Forwarded-Encrypted: i=1; AL+hErFHl67v/aR+OzNYZZITgu36F1j44/dv1czY93F4IVZWQDjFNx2iD1pUrd3p8q0f10jQn8s+n2Y4IuBBxV+vJyFF@lists.infradead.org
X-Gm-Message-State: APuU4Z9ISCAa6A+xQ7UV05dz/QI9BY1myB5U0z32dJI+Fbz2OIrI1EKy
	3QMgWGzY+ZcOMVeBdHI0phu3v6pQibWkazWvIXlzqOYMBor+JBIRD4uRxfyedlT7h2321UpJFlu
	HdG7kFxRm0n1kP/R8+OpNv2dKZksHPjoT7iE9FMt6GA==
X-Gm-Gg: AZFdTZfbGEyd7P97PVW6qA5chMYwIONBqorSiq1jTlE3j/NL5w7AFsms/TWH+toLJNf
	4lHhsAKS6INQ2DXtXgDbvstdxutcXcdktf9+2MGOXBGpP1aCweKllN7dLrQx57uGNd+JKJmTU54
	9RgkjQULVYl8zF0aQCkTojhoBWlC7d4Dp8Acitt5phpHEY85qRA6QGVXyukJlLdOyVuQT2orxTj
	+FFV7Yv9BSvudlKeii6wjfNfr/VhEp1C0saEfze2y2/TU4ZahKpsrzo1pCasdXiuz0KNDWyH6b/
	J2bqW5DoaaCP5DCQk6KMCUH7ghDyjsHLtHtmbI4v5FauH2DbYX4+p4As8e/ORKBMWKBM1MPOXHq
	jsgvu3kvE6RP3+i3pxpbrdhtDlxk6K5zGGwH+xtzE6sWdGO8X42wVGhucrjZE1AKhF9UVH7I=
X-Received: by 2002:a05:6402:1ed4:b0:6ba:6598:1392 with SMTP id
 4fb4d7f45d1cf-6ba6598149bmr7679171a12.8.1795523315933; Tue, 24 Nov 2026
 04:28:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026214359.3122870-1-briannorris@chromium.org> <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
In-Reply-To: <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 24 Nov 2026 12:28:24 +0000
X-Gm-Features: Aa3M54o6_q2ze_X5WV0lDS-4k9Z9r9IbiOz5WhjT-SYs0fIiqKLT_L-3r-75L7Q
Message-ID: <CADrjBPqnRrFeYT9J6NGxy+Xzy1PTZEz+BMs1_u2md7Ra6xPPDQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] soc: google: Add CPM over MailBox Array driver
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, 
	Mariano Marciello <mmarciello@google.com>, Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org, 
	=?UTF-8?Q?Jakub_G=C5=82owacki?= <jglow@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_042838_489537_0557869E 
X-CRM114-Status: GOOD (  28.29  )
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

Hi Brian,

Thanks for your series; it's great to see more Laguna support being posted.

On Mon, 26 Oct 2026 at 21:45, Brian Norris <briannorris@chromium.org> wrote:
>
> The Central Power Manager (CPM) is a co-processor on the Google Tensor
> SoCs, as used on Pixel phones. CPM supports power-management and a
> number of other features.
>
> The Application Processor communicates with CPM over a pair of mailbox
> channels (the "MailBox Array" (MBA)). CPM provides clock, power-domain,
> reset, interrupt services, and more.

[..]

+++ b/drivers/soc/google/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config GOOGLE_CPM_MBA
+       tristate "Google Tensor CPM MailBox Array Interface"
+       depends on ARCH_GOOGLE || COMPILE_TEST
+       depends on MAILBOX

Should we also have "depends on OF"?

+       select AUXILIARY_BUS
+       help
+         Driver for interfacing with the Central Power Manager (CPM) MailBox
+         Array (MBA) found on Google Tensor SoCs. The driver provides APIs for
+         communication between the Application Processor and the CPM, and
+         is required by CPM client drivers such as clock, reset, power
+         domain, and more.

> diff --git a/drivers/soc/google/google-cpm-mba.c b/drivers/soc/google/google-cpm-mba.c
> new file mode 100644
> index 000000000000..629a071e202c
> --- /dev/null
> +++ b/drivers/soc/google/google-cpm-mba.c
> @@ -0,0 +1,964 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Google MailBox Array (MBA) CPM Interface
> + *
> + * Copyright 2023-2026 Google LLC
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/completion.h>
> +#include <linux/device.h>
> +#include <linux/jiffies.h>
> +#include <linux/kref.h>
> +#include <linux/list.h>
> +#include <linux/lockdep.h>
> +#include <linux/mailbox/goog-mba-message.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>

Missing `#include <linux/slab.h>` header here as later it calls
kfree(), kzalloc_obj().
This can cause "implicit declaration of function kfree / kzalloc_obj"
errors with COMPILE_TEST. Also similar issue in clk-cpm.c

> +
> +#include <soc/google/google-cpm-mba.h>
> +
> +#include "google-cpm-mba.h"
> +

[..]
> +static bool cpm_iface_is_valid_req(struct cpm_data *cpm,
> +                                  struct cpm_request *cpm_req)
> +{
> +       struct device *dev = cpm->dev;
> +
> +       if (!cpm_req) {
> +               dev_err(dev, "cpm_req is NULL\n");
> +               return false;
> +       }
> +
> +       if (!cpm_req->req_msg) {
> +               dev_err(dev, "cpm_req->req_msg is NULL\n");
> +               return false;
> +       }
> +
> +       if (cpm_req->msg_type > RESPONSE_MSG || cpm_req->msg_type < ONEWAY_MSG) {
> +               dev_err(dev, "Invalid msg_type: %d\n", cpm_req->msg_type);
> +               return false;
> +       }

Should cpm_req->dst_id also be range checked?

> +
> +       if (cpm_is_request_msg(cpm_req) && !cpm_req->resp_msg) {
> +               dev_err(dev, "cpm_req->resp_msg is NULL when msg_type is REQUEST_MSG\n");
> +               return false;
> +       }
> +
> +       if (cpm_is_response_msg(cpm_req)) {
> +               if (!goog_mba_q_get_valid(&cpm_req->resp_context)) {
> +                       dev_err(dev, "Invalid valid bit in resp_context: %#x\n",
> +                               cpm_req->resp_context);
> +                       return false;
> +               }
> +
> +               if (!cpm_is_response_header(&cpm_req->resp_context)) {
> +                       dev_err(dev, "Invalid response type in resp_context: %#x\n",
> +                               cpm_req->resp_context);
> +                       return false;
> +               }
> +       }
> +
> +       return true;
> +}
> +

[..]

> +
> +static int cpm_init_q_mode_proto(struct cpm_data *cpm)
> +{
> +       struct cpm_payload msg_payload = {};
> +       struct cpm_request req = {
> +               .msg_type = ONEWAY_MSG,
> +               .req_msg = &msg_payload,
> +       };
> +
> +       return __cpm_send_message(cpm, &req, GOOG_MBA_Q_INIT_PROTO_VAL, 0);

Do we want this to have an infinite timeout? If the CPM firmware never
responds, it will hang the boot (as MAX_SCHEDULE_TIMEOUT doesn't arm a
timer).
I guess it is game over anyway if the CPM firmware is dead, but it
would be nice to log an error and return from probe()


> +}
> +
> +static int cpm_init_q_mode(struct cpm_data *cpm)
> +{
> +       int ret;
> +
> +       ret = cpm_init_q_mode_proto(cpm);
> +       if (ret < 0)
> +               return ret;
> +
> +       cpm->seq_num = GOOG_MBA_Q_MIN_SEQ_VAL;
> +
> +       return 0;
> +}
> +
> +static void cpm_adev_release(struct device *dev)
> +{
> +       struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +
> +       of_node_put(dev->of_node);
> +       kfree(adev);
> +}
> +
> +static void cpm_unregister_adev_action(void *data)
> +{
> +       struct auxiliary_device *adev = data;
> +
> +       auxiliary_device_delete(adev);
> +       auxiliary_device_uninit(adev);
> +}
> +

Can we use devm_auxiliary_device_create() instead of open coding these?

> +static int cpm_register_adev(struct cpm_data *cpm, const char *name)
> +{
> +       struct auxiliary_device *adev;
> +       int ret;
> +
> +       adev = kzalloc_obj(*adev, GFP_KERNEL);
> +       if (!adev)
> +               return -ENOMEM;
> +
> +       adev->name = name;
> +       adev->id = 0;
> +       adev->dev.parent = cpm->dev;
> +       adev->dev.release = cpm_adev_release;
> +       device_set_of_node_from_dev(&adev->dev, cpm->dev);
> +
> +       ret = auxiliary_device_init(adev);
> +       if (ret) {
> +               of_node_put(adev->dev.of_node);
> +               kfree(adev);
> +               return ret;
> +       }
> +
> +       ret = auxiliary_device_add(adev);
> +       if (ret) {
> +               auxiliary_device_uninit(adev);
> +               return ret;
> +       }
> +
> +       return devm_add_action_or_reset(cpm->dev, cpm_unregister_adev_action, adev);
> +}
> +

[..]

> +
> +MODULE_DESCRIPTION("Google MBA CPM interface");
> +MODULE_AUTHOR("Lucas Wei <lucaswei@google.com>");

I think you should add Lucas Wei's SoB tag to the patch as part of the DCO

regards,

Peter

