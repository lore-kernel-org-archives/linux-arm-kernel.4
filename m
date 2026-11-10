Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E844260A6F76
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 03:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GjC/xfbs;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YW2ehNQp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kJS+888z9/xW37rRbsLAqP6ADhXzaU9fOkbt37UWOAQ=; b=GjC/xfbsQlyF8AU+1IDeVTi6OG
	fXo1a+fQ4Ioq9Zn73mLeuzxjrS1lm05A65wuIkYEz/pxrC7mzdXRjX0mu4Y/a+CzjV1V8vSRLiqeV
	2hwr86F60kp5ywyvgULrIDcadniTRSDz3JaiLZO7ZS95yCYFfB0hZnEyTJIN8UxSOnYCYrADW/viX
	aPvAZENpsHiCGoFJaWFskfWNMqgUwCPn78Nj4vB0kI4hVThByXHiHudeaFiNuajPjSQKdEjGoFYrX
	rfrUPGHnUw3UncjUQmeH+53P2Tb/1jOGD2BIdeBaJ1osOMxqQVA0YICeEqjqI7t0wATnlqOAd6QgO
	iNOCRtvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIN-00000002EeX-37Sq;
	Tue, 10 Nov 2026 03:13:15 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcIL-00000002EcD-0bVL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 03:13:14 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-5642e0910a3so647253b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 19:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280391; x=1794885191; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kJS+888z9/xW37rRbsLAqP6ADhXzaU9fOkbt37UWOAQ=;
        b=YW2ehNQpf7lZnf2m7g3XOGy1TIzomRN27r8utWbkZeCMAcC9uSGaUZanEp+O+ynFtT
         VjzWEzSicvJ9NbsPGWI6VmjPypR99U3rK7cdWHQYcSTQC+seXerk1/s5km8Ca0a2BvXJ
         fWH5xRzAMOY9vcZWenyVZMYOkmQn3/dugHtG4b7NZJNbs6WLezfCQX/kxQAHszZlYNSA
         k6v+meEMwTo8u168RAAWBRCB82dljYXX96MJXXBYv4iS671AHWYJwE3EvDiMZCc3rZ5b
         W5XRIFfWLZfQbzvhrkWxXQHUPd3syTyLMWznOg2EWxg+y80j24rmYdnjOPKxvQtByjqQ
         YLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280391; x=1794885191;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kJS+888z9/xW37rRbsLAqP6ADhXzaU9fOkbt37UWOAQ=;
        b=xF3qAs7Tg5E/VyScA+vZ58vgVnZpHYD/1yf3cKtZQbtUMRurkm4tK0AJT+VJq/konE
         pKYYLE7uwJyTjDCcmyggz7ocxRGciIC2dYuItWg55PqNLLFp5MphhZtrArn3whFjjWqp
         9tYY4uzQLQHlTK/hzdH9thrJLX2adgyOE3MlLhfRm8/UPR0ZuS79SY/RFAVixPzc7MIX
         ZFsTkMd6AF8tbRrcWy4itNxxSXWAcYx/LzybxfneEBI/hD6gNmVyvvfmVAyu7+3/rQke
         B7pN94g+ooDcdTQNV67VCA2rcoAD+UgW9dMPyUOqPmh4fmBgqvPhBFZdHkfyFfmJeofG
         Tdfg==
X-Forwarded-Encrypted: i=1; AL+hErHnTCOfVDu4Z3n5YIhLuTEL8ZB3AfsazBv3gBjuV1UhGNM2i96rTIeotUbYzikeAc61ZUrY/VPf3pPriUUgVjXi@lists.infradead.org
X-Gm-Message-State: APuU4Z9buhY+CpqkUgVHcHwdqAm75TBkPt7QLI+gkQQGsHrf4sHJVLv1
	u4mshpaNqrbINgReGLLOCM8kiezzd9YcdcTkyPWkvkMHbPfKpH035Kjq
X-Gm-Gg: AYBFou2PBHUqNLQcS+5o26IEijFF0HsLPz++nygGO6dDsRLsGPxwn7Cs0PJUmsDH96y
	L07VefN1dWyUu7rQkshwMoqap2Iv6E0LEIpift6Lzdr4nuUwWeVsJXNiBH+NrYLTHOfU/ieyUqE
	XzYFj2XyTMGCkw7mpwPNIXfBXaICMrlQqgO9V5LfDVPMa5CpCy7N3t/IKY4t/2/IsqDxw0fyBtF
	FqStbrowtRBVuGh303g1IBqSTHZUKr47hlxjyvfvcj//YDqMaFsQRDyI6a4AEl845xzQ7TYU8XW
	g9U1euUwzsVo07F5CGURbODNhPPNDR6/mLpp7T+cNnnij8CcMol+x2MmR4DlAlVxxEAcbF3yavk
	CMXQplnEj/dZRt333YBxrFJYRuDSssonbOy5VzI+bEPJ6zt1EIs0tXYfe83pvgbWWyjQCCHaWRW
	cCXW9HP0CillLikp+zWgzwwBUDEln7qzCmYYEFoTpV//xAp94QCRX/Wc5FC/fYIAZEsKdu33Wrh
	KKIJwImgnE8PF/4PI3w/Ts4wiDRSNXWND/ETYAZL2MGdF9z8aaquNd9350wOlVO87Tab8ny9tSo
	gR5N7IxofT2W/gGZAm9IlDHfmxi67/kKqOUsPAaVLBSau6E5zNCDETNmSQTQV6Ss4Q3Tt7b3PHp
	S/YCK5NqJ+uiRwi3WnnpkXqehG4FUoQp54jt8MjW385ZdfuTlr8b6bxFBpIX5z+WvRrPXrkVa4Q
	s9pecxS7kpDQgKSYd8umr4DyohkfusFZYZu+b9seyYYHtDp/FDxnNU
X-Received: by 2002:a05:6808:30a0:b0:4c4:3997:ef2f with SMTP id 5614622812f47-5683cbaa305mr1043116b6e.17.1794280391467;
        Mon, 09 Nov 2026 19:13:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v9 00/11] serial: 8250_dw: share RX trigger setup and
 describe Allwinner UARTs
Date: Mon, 09 Nov 2026 20:12:49 -0700
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43T22rjMBAA0F8Jfq4W3SWHUvofpQ8jaZSoxPGu7
 KRdSv59x0mXGndrFvwyWDpjz+W9GbAWHJrt5r2peC5D6Y8UtHebJu7huENWEsWN5NIKLiUbTqE
 rI9tbYdkJ6shyyT07CxYN5Jgymhh4Q9d/Vszl7Uo/Pd9iuvuCcZy86cS+DGNff19zn8V07m8a9
 X0aejhDDSoASgzgH3cdlMOP2HfNlOYs/xeSBEHmplWGa6vMElJzSK9AiiDpbY4i+KiiWEJ6Drk
 VSBOUlEMufE4c7BIyc6hdgQxBRgWtFGAI+UuN7CdE0gpkp1+bGhuUtoHHJeTm0FqxHUGxRal9s
 t58rZGfQ2YF8gQJTQ1JMgivwxy63Mas4q8TDfJ4m70mwICM3hO43VgrPbqkow3SRJ+o0kJpgwo
 kT1J42QKgQz3NZ4fDANcN2G7ul+2b9gYOzEtDPXtlqdDu9PWjjYJp4YQGZ1AY+PzEh+9Y/S+2v
 o217NihZBxLhx/TL5hTIjifDOcqze3ny+UPfVsWV9ADAAA=
X-Change-ID: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_191313_233366_46479949 
X-CRM114-Status: GOOD (  20.07  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DesignWare UART receive thresholds are one byte, one quarter full, one
half full and two bytes below full. Describe this mapping in dwlib so
CPR-described DW and LPSS ports use their actual FIFO depth when reporting
or setting rx_trig_bytes. Widen the 8250 threshold tables, setter byte
counts and sysfs parser to 16 bits to support larger DW FIFOs, including
the 2 KiB configuration.

Enable the same interface for Octeon using its fixed 64-byte FIFO depth.
Expose rx_trig_bytes for ports supplying both trigger callbacks, including
port types without a static trigger table. Retain Octeon's special register
accessors, optional-register probe bypass and existing DMA selection.

Reuse the same trigger setup for the Allwinner integrations. H616 has
fixed 256-byte FIFOs without a readable FIFO-depth register. A523, A527
and T527 have different depths across their UARTs and report each port's
depth in the FIFO Clock Control register. Select the fixed platform-data
depth when provided, otherwise read FCC, and validate the depth before
building the threshold table.

Dedicated compatibles select the Allwinner configuration without probing
overlapping optional DesignWare registers. Keep PORT_16550A, configure
automatic flow control, preserve BUSY-safe integer divisor programming
and keep the UART clock gate enabled during termios changes. The sunxi
setup uses PIO.

The series first prepares setup error propagation and platform callbacks,
then widens and shares the 8250 trigger conversion, enables callback-based
sysfs controls, and adds common DW setup and Allwinner bindings and driver
support. The SoC DTS changes are deferred for a separate submission through
the platform tree.

Based on tty-next at 6628e7d4c6b2 with the posted RX trigger callback-lifetime
fix [0] and DW BUSY-safe divisor fix v4 [1]. Platform setup runs before
installing the BUSY-safe divisor setter.

[0] https://lore.kernel.org/r/20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com
[1] https://lore.kernel.org/r/20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v9:
- Keep the conditional setup call and place its error check outside the
  conditional in the preparatory patch, following Andy's review.
- Use FIELD_MODIFY() to update the RX trigger field, converting the FCR
  encoding back to its field value first.
- Collect Andy's Reviewed-by for setup error propagation.
- Link to v8: https://patch.msgid.link/20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com

Changes in v8:
- Defer the H616 and A523 DTS changes for separate submission through the
  platform tree, following Krzysztof's review.
- Separate the dw8250_setup_port() return-type conversion and caller error
  handling into a preparatory patch before the platform setup refactor,
  following Andy's review.
- Place the RX trigger table first in the hardware-configuration members
  of dw8250_port_data, following Andy's review.
- Group and comment the fixed-depth/FCC selection, and use the conditional
  operator for Octeon's default FIFO depth, following Andy's review.
- Carry Andy's Reviewed-by for the H616 driver configuration.
- Link to v7: https://patch.msgid.link/20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com

Changes in v7:
- Rebase onto tty-next at 6628e7d4c6b2 (7.4-rc1), keeping the latest
  posted DW divisor v4 and RX trigger lifetime prerequisites.
- Keep the shared conversion internal to 8250_base now that both callers
  are linked there.
- Move callback-based sysfs exposure ahead of the common DW trigger setup.
- Expose rx_trig_bytes when a port supplies both trigger callbacks, even
  when its port type has no static threshold table.
- Initialize Octeon's FIFO-relative thresholds from its fixed depth while
  preserving register access and DMA selection.
- Widen the 8250 RX trigger tables, setter callback and sysfs parser to
  16-bit byte counts for the larger FIFO depths supported by DesignWare.
- Move FIFO-relative threshold construction and the trigger callbacks
  into dwlib, and use them for CPR-described DW and LPSS ports as well
  as the Allwinner integrations, following Andy's review.
- Share FIFO-depth validation and propagate setup failures through the
  DW and LPSS probe paths before registering a port.
- Keep the existing integer loop in the extracted conversion helper,
  following Andy's review.
- Use explicit fixed-depth and FCC-discovery branches in sunxi setup,
  following Andy's review.
- Clarify that FIFO-relative RX triggers are shared DesignWare behavior;
  describe Allwinner FIFO discovery and register-layout details separately.
- Link to v6: https://patch.msgid.link/20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com

Changes in v6:
- Export the shared RX trigger conversion in the SERIAL_8250 namespace
  and explain how driver callbacks avoid new legacy port types.
- Lead the H616 trigger description with the FIFO-relative mapping
  and include array_size.h explicitly.
- Name the trigger divisors and full-FIFO margin, reusing them for
  FCC depth validation. Explain that the upper bound follows the
  current byte-sized 8250 interface and can be widened with it.
- Describe the fixed-depth platform-data field independently of sunxi.
- Carry Ilpo's setup/helper review tags and Krzysztof's A523 binding ack.
- Link to v5: https://patch.msgid.link/20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com

Changes in v5:
- Reject FIFO depths that cannot produce positive, byte-sized RX trigger
  thresholds, report the invalid size and propagate setup errors to probe.
- Add the A523 UART compatible and use it for the shared CPUX UART nodes,
  including those inherited by the A527 and T527 boards.
- Read the FIFO depth from FCC when sunxi platform data has no fixed
  depth, preserving the fixed H616 configuration and FCC clock controls.
- Explain why the per-port trigger table is derived from the FIFO depth;
  use the same sunxi helper for the FCC-discovered A523-family ports.
- Move the shared RX trigger conversion helper into 8250_port.c and
  export it, following Ilpo's review; retain Andy's review tags.
- Use FIELD_PREP() and an intermediate trigger value when building the
  sunxi table, following Ilpo's review.
- Select the DMA setup helper directly for the 64-bit-only Octeon
  platform and match the single-line comment style, following Andy's review.
- Carry Krzysztof's Acked-by for the unchanged H616 binding addition.
- Link to v4: https://patch.msgid.link/20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com

Changes in v4:
- Introduce common Allwinner setup helpers with the fixed FIFO depth
  supplied by compatible-specific platform data.
- Rebase onto tty-next at 6b4b543fa187 and the posted DW divisor v4 fix,
  installing the BUSY-safe setter after platform setup.
- Use an early return for FIFO-less DMA setup, following Andy's review.
- Default to generic setup when platform data has no setup callback.
- Select Octeon's optional-register discovery with IS_ENABLED() in its
  setup helper, preserving the existing 32-bit and 64-bit behavior.
- Extract the shared 8250 bytes-to-FCR conversion, including the
  unsupported-table check, into a preparatory patch and use it for
  H616, following Andy's review.
- Set the fixed 256-byte FIFO depth in H616 platform data and omit
  fifo-size from its binding and DTS, following Krzysztof's review.
- Precompute the Allwinner RX thresholds during setup and retain the
  sunxi FIFO-depth helper for filling the table. Use named FCR encodings
  in the helper, following Jiri's review.
- Share threshold-table initialization and callback assignment through
  a sunxi RX trigger setup helper.
- Group and comment the H616 trigger and RS485 setup.
- Link to v3: https://patch.msgid.link/20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com

Changes in v3:
- Introduce a platform-data setup callback in a preparatory patch,
  replacing skip_autocfg and preserving the existing Octeon setup.
- Describe each H616 UART's FIFO capacity with the standard fifo-size DT
  property and use the value already read by uart_read_port_properties().
- Derive the Allwinner RX trigger thresholds from the FIFO depth.
- Use an unsigned trigger index and conditional runtime PM guard,
  preserving error propagation when the device cannot resume.
- Rebase onto tty-next, replacing the earlier DMA prerequisites with the
  posted RX trigger callback-lifetime fix.
- Separate DMA enablement into follow-up work, retaining PIO operation
  for the H616 FIFO configuration.
- Link to v2: https://lore.kernel.org/r/20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com

Changes in v2:
- Keep PORT_16550A and set the FIFO size, transmit load and capabilities
  during setup, following Andy's review.
- Select H616 setup through the matched platform-data pointer and remove
  the type and DMA burst-size platform-data members.
- Use get_rxtrig/set_rxtrig for the 1/64/128/254-byte receive thresholds,
  with port locking and runtime PM around register updates. Keep the
  standard half-full FCR default, selecting 128 bytes on H616.
- Advertise UART_CAP_AFE so CRTSCTS enables hardware automatic flow control.
- Rebase onto next-20261023 and declare the posted sun6i pause/lifetime
  fixes and their prerequisites for DMA enablement.
- Link to v1: https://lore.kernel.org/r/20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com

To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-serial@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
James Hilliard (11):
      serial: 8250_dw: allow port setup to report errors
      serial: 8250_dw: select port setup through platform data
      serial: 8250: widen RX trigger byte counts to 16 bits
      serial: 8250: share the RX trigger conversion helper
      serial: 8250: expose RX trigger controls for custom callbacks
      serial: 8250_dw: derive RX trigger thresholds from the FIFO depth
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner H616
      serial: 8250_dw: configure the Allwinner H616 UART
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner A523
      serial: 8250_dw: discover Allwinner A523 FIFO depths through FCC
      serial: 8250_dw: configure RX trigger thresholds for Octeon

 .../bindings/serial/snps-dw-apb-uart.yaml          |   2 +
 drivers/tty/serial/8250/8250.h                     |   4 +-
 drivers/tty/serial/8250/8250_dw.c                  | 116 +++++++++++++++++++--
 drivers/tty/serial/8250/8250_dwlib.c               |  93 ++++++++++++++++-
 drivers/tty/serial/8250/8250_dwlib.h               |   4 +-
 drivers/tty/serial/8250/8250_lpss.c                |   4 +-
 drivers/tty/serial/8250/8250_mxpcie.c              |   2 +-
 drivers/tty/serial/8250/8250_port.c                |  27 +++--
 include/linux/serial_core.h                        |   2 +-
 9 files changed, 226 insertions(+), 28 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
prerequisite-message-id: <20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com>
prerequisite-patch-id: d8219673210dac82d3adab41578ff2f76f5862c9
prerequisite-message-id: <20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com>
prerequisite-patch-id: 9a9395c715c2bf7bbcae5bdd16a339d7f2af6269

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


