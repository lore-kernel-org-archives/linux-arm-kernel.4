Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4817B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 20:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NN6mp8lv;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CfaYb07K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cJ2ObhZVOW9zHYEagygnyL7A/D9me4jEjQcn9wi7PeQ=; b=NN6mp8lvCUZ6a7zLVsBS08dok+
	4kipgmtHY0apYLleWiW7Q9dvzdc6hyJxQw+nVmsN3PEzu3GerZ6V3NE8+WGzD8GaaoQNr89tRp5Yg
	oOzETlQTUkB7T27KMPRCaNO8irCBPDZZCUqM0oSERhMg1IcE5i+L3mVDvvPpArTO6iE5pMTZzR0jg
	IvrSnFDGiw3nTvmaLJENKSzPn9y+FwwPpCK1sYmVfkPftYBpWz7eAu20EbfgRELzfI4JAv04Pny7S
	nSaLQSqIka3rXWwNiNUSNKO4tPOoHpd7FJ7kCj0d5dfJNOAaLJdQuG311S3U+/P+KdeaXUe2FCu8g
	xcBu+rvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVx29-00000007iI1-0f9p;
	Tue, 24 Nov 2026 20:22:33 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVx22-00000007iFq-1E1o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:22:27 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so2929161f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 12:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795551744; x=1796156544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJ2ObhZVOW9zHYEagygnyL7A/D9me4jEjQcn9wi7PeQ=;
        b=CfaYb07K7+urlZds89cQlraIwr5ZgJ6CD7BAOkWlGaTjeDSfmAjtFfMU2Ksr4mAk9y
         YD4NEOg60Y+XPFi/TQ4rhDLDh9sUeiMSi4DbGY3gBepfTRT+I64LGYXzQKn8ycg4sBYI
         XlXwlou6rsAsrKHACfwkElAcT9IqC1x7Ns8+YFpLtVjMBGtRvfrag3fmn9XVXK11TsJU
         7dv9E7dtJZQxadhx0r2+1VpIVZyqj8Id6g2o2vGzRrkcC7J7f9NfxeWCN65dhpbQcT3X
         47+2oqzX9aIh4V5dqSzj4/RaVFfZQ2dWBPjpT67vFatE67CrLzlhq3Xv7/o8ceq7+DZS
         jrqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551744; x=1796156544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJ2ObhZVOW9zHYEagygnyL7A/D9me4jEjQcn9wi7PeQ=;
        b=QWdapuy+BHWoHOEcFE0pdKvBQyINZ9zcmyZk9UVl2zVaOeEKJ2z7YV7htMSffxfO5T
         B19PW5RudS86tE/1UA9cd0BEtU9uw9PG4SrHPfZd046GGfajH+fZCYGClP/NbupI/z5D
         a79zJs6eX5eNXR+llc14jtHhO8j7y9afwe8kVYBzbzdBz//vz6baemIJ2HfRusEVW+x2
         WWA5vcnNp8522OF2kp07671SK+dlJoy6dsFb3b9rvW2tMuWF4oE5p6ox9r/S31hGme+4
         zIltOEC9yfXJhw6xRPcHW+wp24nkLoRTBELzsRZxDj+XtqjS1dFJFCjiMoHTZER80FU/
         cGCA==
X-Forwarded-Encrypted: i=1; AL+hErFxcvKp/XD2oJxX8+vpzpxhz9JARS73jRZeGFGFDtrRpR3tKMgMYwR7W2RQAFJUcmjmmPymA9q5fE3EsOHEM+SC@lists.infradead.org
X-Gm-Message-State: APuU4Z80WU70GWyYMkBoQx8EbbIuLN8+ZyFF9MHRXFIhAagzoi5lSQt9
	GsRqB6wde/mNRr/z3ynXfG99u5Qmk8c0+Qjgr8PpCNeHhlskiel8o7Lz38YdH6j+JUk=
X-Gm-Gg: AZFdTZdDznSnaMyZ1P7VPypKlY3A9KXEEuAML+MrfXE1lk8LQwfUpQXcHuCldmtvH2P
	vPdk2lEsQibLd22H3M5uWGjvctiEhRX+QKyHbbpuFgWNVja8lnbSLpOPJqcX36D7NsewNVv2zct
	RC37QhkvYhNn1+7vkftUwp7ctx2tsc6OKfHqlBAkdySI4hSeaSLx4eo7PqfjmS8s6tIATB15h64
	34jQGhV7ATgs129D4N2d2T/eLVZwAt4rzW9NWKzWL40m45qyngKa0x2Ej/oyadXEnMUd/LZ4VAb
	S1YJ+CUYCRXxkuqgGBZNyChk0/ucut3XWyOedHPRKKsYxguRQrHG1YrKBUogsJR0DJZY/u+mEhb
	aiqT9xv8qIKVZX0jmWJZk9MHKu6dsdJLcikkmTdKoMhhpFaMDsZ9so95UsZCpgqtX9HZoAeOCPd
	DILpQ4UemyG6tLoU31CPT2zqxdWs/xcrgfjSvk/tv+xQZF424fEkRfthi3lmIB4/3r5Ne/5Li1z
	uHN8As1YWoW89GENbyPwTWOBwpCQHHGlNMdkA5tRbJMp9+ca8NJWdLrc6XATCK93mjt0dfI3Pvy
	tC1gIUjHa2bCb/U4ldIo6nHwL21MCvaIF4tJQFliEOxM8C18FQRG7gao+gVZyup5D3mhJZWkKNd
	I8mAcyGefnTk=
X-Received: by 2002:a05:6000:1841:b0:48e:6f76:de9d with SMTP id ffacd0b85a97d-4abb4c7ac1dmr35270346f8f.46.1795551743608;
        Tue, 24 Nov 2026 12:22:23 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm35130525f8f.21.2026.11.24.12.22.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 12:22:23 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com
Cc: fabrice.gasnier@foss.st.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] iio: adc: stm32: describe the STM32H7 temperature sensor calibration
Date: Tue, 24 Nov 2026 21:22:18 +0100
Message-ID: <20261124202220.23721-1-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_122226_433946_91BC57C6 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 2.2 (++)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The STM32 ADC binding lets an ADC take the factory calibration of its
internal voltage reference (VREFINT_CAL) as an nvmem cell, but not the
two calibration points of the internal temperature sensor (TS_CAL1 and
TS_CAL2), although the STM32F4 and STM32MP1 device trees already
describe those cells.

This series adds the two temperature sensor calibration cells to the
binding, and describes the factory calibration area of the STM32H7 in
system memory, passing its cells to ADC3, which the temperature sensor
and VREFINT are connected to.

PebbleOS uses these bindings, including the new cells, to describe the
STM32H747 and read its temperature sensor.

Gerard Marull-Paretas (2):
  dt-bindings: iio: adc: st,stm32-adc: add temperature sensor
    calibration cells
  ARM: dts: stm32: add the factory calibration data to stm32h743

 .../bindings/iio/adc/st,stm32-adc.yaml        | 10 +++++++++
 arch/arm/boot/dts/st/stm32h743.dtsi           | 21 +++++++++++++++++++
 2 files changed, 31 insertions(+)


base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
-- 
2.45.2


