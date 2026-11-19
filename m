Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC872606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E1iDAgjs;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=D5KCGbxY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=p+dKc+IASGuU74BQrkjO8c1LFAuMGojRAMZOBhZUcyk=; b=E1iDAgjsb0PX6m23WwyYgTUvup
	q8WaESnyK1ONKgqQ7EuPAdrGrw8a1XP06div4VJJb+lE4nxWZ6FWQFZRNnPua6z0pzE+HyzAIset0
	Qrhk0E/WHCynmIiXU/HtdAJ9oXqEiQFAJJpmOXqgZ+f5Ii1uPbBSsGjQgoMUjze4wf4lC7HuIeCwU
	+k863iGnVIINO+2TqhA6KPSv7Q4z8KriETl7Gmk91Bja3aoyOZX+qgrCYNYevQEa8XsxoJq7iStRf
	V1wC1ylZm6GxUL9ILkX6vjdUperZ1wqTyN0XVEUN6NkEH0GMaIIEMIiDAOV0aaggEq4PaOFk0UJAg
	N9BMr96A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxN2-0000000BAKe-0wmD;
	Thu, 19 Nov 2026 08:19:52 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxMy-0000000BAKB-3IqX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:19:50 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so16759785e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795076386; x=1795681186; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p+dKc+IASGuU74BQrkjO8c1LFAuMGojRAMZOBhZUcyk=;
        b=D5KCGbxYW/wgt8p3ZsE5JU4rqlqPD419XNA+nmeztr0gV3l6p0bwb3t+5zo4MKDuTP
         ykRLoDEjZFdUVywV/tG5VP2OpPfgbS5CZhC05En2fOsGm72vwdypqW5XSQtDhW29Tt0H
         qqIaC1iQRjBhP3QTScfkQTnYMNGUHm9Tjcq7bgX5IXesyCFobbrfuU+oGsktwRTNxA37
         BK/0RuaGXIfd5c0AZulqp5OalsBh454/SEeGjmTX5DaKnidiAfZCjNZw6j9JJsRnaMPL
         krf+hmyikkPv1HuXa5snuon5Eju8r7kKWDGrkqRFTlagGXgGmseOpIbXK0NPcSz/FL39
         3SKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076386; x=1795681186;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p+dKc+IASGuU74BQrkjO8c1LFAuMGojRAMZOBhZUcyk=;
        b=s44nFr2vLZIgaDyh/29wpgQfGgK1Z6HkMSx5zNSk6a1gC1BhpYF0DqS1TuaO6mfJS5
         2gCNoArbPpCJVxHj0KZvEkNWWRStRtBbpulyLBfgSuZ0rcPmq9SXMaXSihYsGzj82/nk
         i2kPiMJZufQeWR/t5DbfcO5YPrtlzTSIT8aQCTrlZobJCXJUEeeeY00lutD0DYRjGw7y
         pTIaEVi0bGntUllHUFAp0kd/AM+6u2BeCJmlrB7nxBSskkWvUoXUw++pH6Q2vmToKYHg
         kvK1gxAKiIQ2GHZJIELCAVvKvFJMti62Hgvhm4V5zppMcmkSgznycjb5p4NMIf5eGjXL
         BBBQ==
X-Forwarded-Encrypted: i=1; AL+hErFWYI2nwOUQG/c1hYf4kbhTl8wuah0BvWjqf00DJNma2CZql4gxJoAyBCYSv1VoR4PlJ6RDfS8xzwvVLNR7irjj@lists.infradead.org
X-Gm-Message-State: APuU4Z92p2qgfHsfrhOB+QIa+uIT65pOzmA5jlJGBOtwg5uOCAXM4QeH
	CsrSYtNKhx+G/RJPeR2MWvkNuvWeoXzzdRMVd5XiamtsJbLfiUZyvzwaLUgJ2Kkpv6k=
X-Gm-Gg: AYBFou2Ni6fmemnhEqIDwyjFjIaH60HryBye5G6pEC4oqWhp50DK6VoqvWjQo16godO
	/pIBiF45/D9cEqY6WnCRNtOJM7xISZg5mNNCXElYREmht7MhH6TO1CaoOQ+HErnSRpZ/jTFE1aa
	X8D+RCpZLMdrf8anL0a7WUz+i+Kp2XPmxvj86Zk9NxA5BInx6IC5qjSdILHAN+CyQ7j23FVpt06
	exV8Q0H1P4HRCd/h6lBXRemD7RwQ+6KxDwWxSxqfPRfFMRsiGrwP0keSMGVPChfwLjSenX1ZCZp
	WdBfTFMpDMEbtxnERuhObuiAp0O5WX18MiAoI3qvUPGCSe0JcF1KCgmnjkI6RwtBEyxnfDejAQO
	7P8ax8fUj1X22pnmjDzrj66JKhCk1ehhym8NTIpx2AlF/wroNDiWogNqgim74H+EkL437gqs6XR
	UXZwur5mUupsCUsSnZ+J7wLYgH7fTe23vyHINjjSRqzQMje24eF1PMMgnO0THD1vH6XlLw7lt5J
	u9MRUytFQ2POl2WnGpGnk89IUVc4cJmjTFunths2YRZ5igKUNpMqkumxtm9d6MfSX1d/303l7R2
	obLtdCLIpAgd/fFxoiiO2H4eqzw9C6Hegwf/+TCJAIzX+pKO
X-Received: by 2002:a05:600c:8b63:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4bb7da27088mr96761205e9.28.1795076386236;
        Thu, 19 Nov 2026 00:19:46 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e5656asm17330585e9.3.2026.11.19.00.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:19:45 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Gregory Williams <gregory.williams@amd.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, Oded Gabbay
 <ogabbay@kernel.org>, kishore Manne <nava.kishore.manne@amd.com>, Izhar
 Ameer Shaikh <izhar.ameer.shaikh@amd.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
 Ronak Jain <ronak.jain@amd.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 00/15] accel: Add AMD Versal AI Engine driver (with
 Versal Gen 2 firmware support)
In-Reply-To: <20261118233211.4121361-1-gregory.williams@amd.com>
References: <20261118233211.4121361-1-gregory.williams@amd.com>
Date: Thu, 19 Nov 2026 09:19:45 +0100
Message-ID: <1jcxs12py6.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_001948_881992_D4BE30E3 
X-CRM114-Status: GOOD (  31.28  )
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

On mer. 18 nov. 2026 at 15:31, Gregory Williams <gregory.williams@amd.com> wrote:

> This series adds a driver for the AMD AI Engine (AIE) found on Versal
> devices, together with the firmware changes the driver depends on. AI Engine
> is a tile array based accelerator used for applications such as beamforming and
> machine learning inference. Tiles are organised in columns, and groups of
> columns form partitions that an application requests, initialises and releases.
>
> Several registers in the AI Engine array (column and shim resets, memory
> zeroisation, tile clock gating, NoC and interrupt routing) are privileged
> and can only be written by the trusted firmware. The driver therefore
> packs operations into a DMA buffer and hands it to the platform firmware,
> which executes them in order.
>
> Firmware patches included
> -------------------------
> Patches 1-10 are not part of the AI Engine driver itself, but the driver
> cannot work without them, so they are included here to keep the series
> self-contained and reviewable in one place:
>
>   - 1-5:  zynqmp firmware driver refactoring and a va_start()/va_end()
>           fix (patch 2 carries Fixes: tags), preparing for the extended
>           SMCCC call format.
>   - 6-7:  Versal Gen 2 compatible string and firmware support, where all
>           EEMI APIs use the extended SMCCC payload.
>   - 8-9:  Versal Gen 2 clock binding and clk driver match entry.
>   - 10:   firmware IOCTL support for the Versal Gen 2 AIE run time
>           operations, used by the driver.
>
> I am happy to split out or reorder the firmware and clock patches if the
> maintainers prefer to take them through their own trees, and would
> appreciate guidance on how the series should be merged.

For the clock, it would defenitely be prefered if you could split out
clock part, especially if you later need an immutable branch.

`b4` makes it very easy to handle series deps, please consider using the
related tags

https://b4.docs.kernel.org/en/latest/contributor/prep.html#working-with-series-dependencies

>
> AI Engine driver
> ----------------
>   - 11:   devicetree binding for the AI Engine.
>   - 12:   driver core: device probe, partition request and release.
>   - 13:   pm ops: building and sending firmware operation packets.
>   - 14:   enabling and disabling tile clocks.
>   - 15:   partition initialize and teardown (reset operations).
>
> Previous submission
> -------------------
> This driver was posted for review a little over a year ago:
>
>   https://lore.kernel.org/dri-devel/20250702155630.1737227-1-gregory.williams@amd.com/
>
> Since then the scope of what is proposed for upstream has changed, this series
> is considerably different from that posting, in particular targeting only Versal
> Gen 2 support. All comments received on the earlier posting have been addressed
> or in this version.
>
> Abhyuday Godhasara (1):
>   drivers: firmware: xilinx: Add IOCTL support for the AIE run time
>     operations
>
> Gregory Williams (5):
>   dt-bindings: soc: xilinx: Add Versal AI Engine DT binding
>   accel/amd-ai-engine: Add AMD AI Engine device driver
>   accel/amd-ai-engine: Add pm ops for firmware calls
>   accel/amd-ai-engine: Add support to enable/disable tile clocks
>   accel/amd-ai-engine: Add reset operations
>
> Naman Trivedi (1):
>   dt-bindings: clock: versal: add Versal Gen 2 compatible string
>
> Senthil Nathan Thangaraj (8):
>   firmware: xilinx: Separate TF-A checking
>   firmware: xilinx: Call va_start after pm feature check
>   firmware: xilinx: Add comments about number of arguments
>   firmware: xilinx: Use match data for ZynqMP/Versal
>   firmware: xilinx: Rename zynqmp_pm_invoke_fw_fn()
>   dt-bindings: firmware: xilinx: Add Versal Gen 2 compatible string
>   firmware: xilinx: Add support for Versal Gen 2
>   clk: zynqmp: Add Versal Gen 2 compatible string
>
>  .../bindings/clock/xlnx,versal-clk.yaml       |   5 +-
>  .../firmware/xilinx/xlnx,zynqmp-firmware.yaml |   3 +
>  .../bindings/soc/xilinx/xlnx,ai-engine.yaml   |  61 +++
>  MAINTAINERS                                   |   9 +
>  drivers/accel/Kconfig                         |   1 +
>  drivers/accel/Makefile                        |   3 +-
>  drivers/accel/amd-ai-engine/Kconfig           |  15 +
>  drivers/accel/amd-ai-engine/Makefile          |  14 +
>  .../accel/amd-ai-engine/ai-engine-aiemlv2.c   | 441 ++++++++++++++++
>  drivers/accel/amd-ai-engine/ai-engine-clock.c | 154 ++++++
>  drivers/accel/amd-ai-engine/ai-engine-dev.c   | 255 ++++++++++
>  .../accel/amd-ai-engine/ai-engine-internal.h  | 377 ++++++++++++++
>  drivers/accel/amd-ai-engine/ai-engine-part.c  | 140 ++++++
>  drivers/accel/amd-ai-engine/ai-engine-pm.c    | 472 ++++++++++++++++++
>  drivers/accel/amd-ai-engine/ai-engine-res.c   | 184 +++++++
>  drivers/accel/amd-ai-engine/ai-engine-reset.c |  69 +++
>  drivers/clk/zynqmp/clkc.c                     |   1 +
>  drivers/firmware/xilinx/zynqmp.c              | 340 +++++++++++--
>  include/linux/amd-ai-engine.h                 | 115 +++++
>  include/linux/firmware/xlnx-zynqmp.h          |  65 ++-
>  20 files changed, 2679 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
>  create mode 100644 drivers/accel/amd-ai-engine/Kconfig
>  create mode 100644 drivers/accel/amd-ai-engine/Makefile
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-aiemlv2.c
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-clock.c
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-dev.c
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-internal.h
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-part.c
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-pm.c
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-res.c
>  create mode 100644 drivers/accel/amd-ai-engine/ai-engine-reset.c
>  create mode 100644 include/linux/amd-ai-engine.h
>
> -- 
> 2.34.1
>

-- 
Jerome

