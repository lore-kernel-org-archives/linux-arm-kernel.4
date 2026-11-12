Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB56606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 19:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qOWa1h2I;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rvQo7tsy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ME4Lm952VssEFecXKMuEh0Vy6xCAkVUAnYCqLJV83BU=; b=qOWa1h2IBDQWHWCyoR34jiyhE6
	lR/pUBzcLyGMIZXWFbRpq8TEhqOAzBiJP5pBaMPA6etn8lDbhfI/Ud0+HqthLGaFQdZegwjlp1CIF
	5oWgnKiVST32Ia40nBiF5eN8GI/ERIpcf7YL2sIc+JPig9w0IaKC1YRHYKYeQ7HucyYC2lH3nuXns
	cowfnSrSdP6CwjHxy7rMAPDB/dnZdHvYnZi7ee/mnrKuaYkYx+3/JQ3mHtrsmYHRagsLVf7smorxx
	SE4LHpRfWwKqS2X1yKLXxzobgWZZwpMMaolouRnMlErgga6053EHg6Eutkr/oCR175u5y7XWjgnsP
	Gri/9FmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaXX-0000000Ax6f-1rGC;
	Thu, 12 Nov 2026 19:32:55 +0000
Received: from mail-dy2-x08.google.com ([2607:f8b0:4864:36::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRaXV-0000000Ax6J-00zd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 19:32:54 +0000
Received: by mail-dy2-x08.google.com with SMTP id 5a478bee46e88-3678f64d078so239379eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 11:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794511972; x=1795116772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ME4Lm952VssEFecXKMuEh0Vy6xCAkVUAnYCqLJV83BU=;
        b=rvQo7tsyp04wC/6NT3KaWzxy5EqJBw9CT+fbQ65X6t3hRTQxs54Y+b6z4ci9ISjcwF
         NjdPMvkIyCys1T7dJJ8/eEDZUOWq8IwoXT/I6hCeASQdhtKS8X8eZS/FiO7V6omKxKbi
         MTZnvtOHerZIlCjOwc9SGfPdLnmqt8uFg0/Bx8Zw7Gcb+Nl5ZN6KiQxKO3H4AeYLNohc
         4BzPd1hF4oIZqvlRt1qC6s9Kqya7LJFgIDsldijXPQaefn3cmGwOdaVBbFehI7cAb9zY
         UszvCCji6EC5pGXWSJu+PpgzL7EBCpPOc4rnwxNVvmPAHz4izsr2n9hAabL8mtQMfEYn
         I+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794511972; x=1795116772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ME4Lm952VssEFecXKMuEh0Vy6xCAkVUAnYCqLJV83BU=;
        b=h1eWvUQKa0VptjVDm1YlPHwjCKDlRCNl1EZieYpWWr9WB5IGJribMUxKslyR9mtEeT
         DxhG6hoLDGm2ys9AknK6UC5yUVYjOMkqvFBuoRjgJRnaPLT5MeZHZSXWXevXHC9Iui8u
         hjA7kmjOcZjt3OLwa454/EGGDr6u0PMwZlt7DYmxKLrsOs+3BFuSrhpt5ZcMMIK3cwY7
         yC/wlZVcvcOa8I+AxKwuw6g33EeZmCl00xTC5LUa2CYAO/MV+AVPnJrJJ8KT+NgQx0En
         H7qcl10NhRD9qNuM2P3ppk1ZTfdsmEw9rRyoRluOPqeaq9VJe+MENPQItVIHW8PMrpV6
         lw9Q==
X-Forwarded-Encrypted: i=1; AL+hErGLK2PIy55Yg5BK+PowIhOaBCMMdHoNR/nXXIGoRwJ1LadVz+iX0HdTQjmeaWobXlLPdWTbM4pOqYjqdMCu6ATT@lists.infradead.org
X-Gm-Message-State: APuU4Z8NfWfoyf7S03TQgZO47TmKVn7x/yYaYLzAOCTsRTHAPzQRZVhZ
	a7yvHYMFcEDvkRlDAxdawQ2422RcGfDBrwCRAmqlmf1kUUBbDsaSc9t8
X-Gm-Gg: AYBFou16ROckrrif2EZqO4CJmHgG+JoQurv7SvELj8M49tT2IMaAhdetQ0hCYvGpSmn
	aJRdjE9QyXuUzsFisqhMUEt3nkL+nmVRYqKuexxvkfvPr8BWHEVw2JuwqxrkBbvUfTDMgNIoKyJ
	YCsBG+cgp5BydSirghd8rTubWVd3xmCH67kcWCWsfanDiTHPOKxT5m+dpblbGSYnP/llSqyQbRA
	//i640uz7B2Ip4GoAhos8R6KXHJsLVX1RJshDlucQvTR90jn2rnjOs3VWSdNiK9B93alpawM7Iw
	NDN4ARkt7QoSNkOoP+TNAPEKQ+U4TVJNp9E3fcNff0yxUVYlbuUuazZgQlWHfL05enlDl0I2I8+
	TId31dGOltu2mIQqLhUnTPwnTT5RH5TTyhtJaymd7o+SySTgFykfLtIoPPbCSWzqoSpGq6K3pw8
	QtZGVWRdDu6iaLAHrgKD2JkgMJpiSW5j5veb5mxpa7EYNaaCQz2TIC4yuFCeCkep819Q3SlYgid
	B9eXfnCSGkH1YbHVI3gvG6vP02ODzztKXLnkYBlKJ8U5UsQvw3GXtS9Axo9ydQiS5ZUZ28SYUQW
	ykP3Qzy/shBnDororzLaiz7mv0/Osk4cka4DPNumCU714BD01g==
X-Received: by 2002:a05:7300:828e:b0:356:7ddb:2e54 with SMTP id 5a478bee46e88-37966a5ce93mr121854eec.29.1794511971759;
        Thu, 12 Nov 2026 11:32:51 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm565379eec.14.2026.11.12.11.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:32:51 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v3 0/2] ARM: dts: zynq: Add ALINX AX7Z020B development board
Date: Fri, 13 Nov 2026 03:32:43 +0800
Message-ID: <20261112193245.250149-1-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_113253_047059_9D26F1BE 
X-CRM114-Status: GOOD (  13.90  )
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

Add devicetree support for the ALINX AX7Z020B board, built around the
ALINX AC7Z020 system on module with a Zynq-7000 (XC7Z020-2CLG400I) SoC.

Changes in v3:
- Drop the vendor website Link: tags (Krzysztof Kozlowski).
- Drop the empty bootargs property (Krzysztof Kozlowski).
- Rename the USB PHY node from phy0 to phy, as there is only one USB PHY
  on the board (Krzysztof Kozlowski).
- Keep the explicit mdio node under gem0, as requested during the v1
  review and reviewed by Andrew Lunn in v2.  dtc W=1 flags the parent
  node's inherited #address-cells/#size-cells.  DT schema validation
  reports the same Zynq-7000 diagnostics as zynq-zybo-z7.  The MDIO
  layout was also verified on hardware.
- Sort I2C child nodes by address and reorder status/reg properties.
- Add Krzysztof's Acked-by to patch 1.

The "alinx" vendor prefix is already queued in linux-next as commit
1f06cd374a60 ("dt-bindings: vendor-prefixes: Add ALINX vendor prefix"),
so it is not part of this series.

Tested on hardware before the DTS style reordering: SD boot, UART
console, SD card, GbE (900+ Mbps and LED hardware offload), dual CAN,
I2C, QSPI and XADC.

Pufan Jin (2):
  dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
  ARM: dts: zynq: Add ALINX AX7Z020B development board

 .../bindings/soc/xilinx/xilinx.yaml           |   5 +
 arch/arm/boot/dts/xilinx/Makefile             |   1 +
 .../boot/dts/xilinx/zynq-alinx-ac7z020.dtsi   |  71 +++++++++
 .../boot/dts/xilinx/zynq-alinx-ax7z020b.dts   | 146 ++++++++++++++++++
 4 files changed, 223 insertions(+)
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts

Range-diff against v2:
1:  f44b8dc6e6 ! 1:  ca50a01108 dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
    @@ Commit message
         Document the ALINX AX7Z020B development board, built around the ALINX
         AC7Z020 system on module.
     
    -    Link: https://www.alinx.com/
         Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
    +    Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
     
      ## Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml ##
     @@ Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml: properties:
2:  a985ee80d4 ! 2:  477061f136 ARM: dts: zynq: Add ALINX AX7Z020B development board
    @@ Commit message
         always accessible from the PS, so expose these channels via the
         driver's xlnx,channels property.
     
    -    Link: https://www.alinx.com/
         Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
     
      ## arch/arm/boot/dts/xilinx/Makefile ##
    @@ arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi (new)
     +
     +&qspi {
     +	bootph-all;
    -+	status = "okay";
     +	num-cs = <1>;
     +
    ++	status = "okay";
    ++
     +	flash@0 {
     +		compatible = "jedec,spi-nor";
     +		reg = <0>;
    @@ arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi (new)
     +			#size-cells = <1>;
     +
     +			partition@0 {
    -+				label = "boot";
     +				reg = <0x00000000 0x00500000>;
    ++				label = "boot";
     +			};
     +
     +			partition@500000 {
    -+				label = "bootenv";
     +				reg = <0x00500000 0x00020000>;
    ++				label = "bootenv";
     +			};
     +
     +			partition@520000 {
    -+				label = "image";
     +				reg = <0x00520000 0x00a80000>;
    ++				label = "image";
     +			};
     +
     +			partition@fa0000 {
    -+				label = "spare";
     +				reg = <0x00fa0000 0x01060000>;
    ++				label = "spare";
     +			};
     +		};
     +	};
    @@ arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts (new)
     +	};
     +
     +	chosen {
    -+		bootargs = "";
     +		stdout-path = "serial0:115200n8";
     +	};
     +
    -+	usb_phy0: phy0 {
    ++	usb_phy0: phy {
     +		compatible = "usb-nop-xceiv";
     +		#phy-cells = <0>;
     +		reset-gpios = <&gpio0 46 GPIO_ACTIVE_LOW>;
    @@ arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts (new)
     +};
     +
     +&gem0 {
    -+	status = "okay";
     +	phy-mode = "rgmii-id";
     +	phy-handle = <&ethernet_phy>;
     +
    ++	status = "okay";
    ++
     +	mdio {
     +		#address-cells = <1>;
     +		#size-cells = <0>;
    @@ arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts (new)
     +};
     +
     +&i2c0 {
    -+	status = "okay";
     +	clock-frequency = <100000>;
     +
    ++	status = "okay";
    ++
    ++	temperature-sensor@48 {
    ++		compatible = "national,lm75";
    ++		reg = <0x48>;
    ++	};
    ++
     +	eeprom@50 {
     +		compatible = "atmel,24c04";
     +		reg = <0x50>;
    @@ arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts (new)
     +		compatible = "dallas,ds1338";
     +		reg = <0x68>;
     +	};
    -+
    -+	temperature-sensor@48 {
    -+		compatible = "national,lm75";
    -+		reg = <0x48>;
    -+	};
     +};
     +
     +&sdhci0 {
     +	bootph-all;
    -+	status = "okay";
     +	disable-wp;
    ++
    ++	status = "okay";
     +};
     +
     +&uart0 {
    @@ arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts (new)
     +
     +&uart1 {
     +	bootph-all;
    ++
     +	status = "okay";
     +};
     +
     +&usb0 {
    -+	status = "okay";
     +	dr_mode = "host";
     +	usb-phy = <&usb_phy0>;
    ++
    ++	status = "okay";
     +};

-- 
2.56.0


