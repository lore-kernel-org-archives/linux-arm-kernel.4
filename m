Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E67606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nwxzrXYE;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t6tcn+dw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GV/jfsFbMmkXTAQ4EO3mdq+1dYga/vXLHfb1SaIoXw4=; b=nwxzrXYEddil/b
	Ru/5BrFgqn8dCiKn0VTHU1QJtsQPqr0j542MfFeWiwznhh/FZsBYgcTW05dFTWR2CGprBzpsY0G+1
	reHAHlTbnCEfdwxNxSK3gJOjHKp37rtj09w1lsKCxIGdCs4MYSmeJAj+PBhoxSxk9ohTDp+uj0SaY
	N5n33+wdHq/B8LRzpjUpXjpvlXtnjTby+EKGBH+m6T9xKxkczgx3ObMgD7Z77NchVen2vRa2K4Q9E
	1Orr1klGVYWZgZ6f2xu564uA+qSMEv2EK9BVCfcUJZhfa/15INgV+erhkXF6BE0PvP1c4RbLZYCwf
	C4So8K3MiCK4Vvjjr34g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR72y-00000006bvF-1OF5;
	Wed, 11 Nov 2026 12:03:24 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR72v-00000006bsM-2MWT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 12:03:23 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-67c6f1019a3so371914d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 04:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794398600; x=1795003400; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GV/jfsFbMmkXTAQ4EO3mdq+1dYga/vXLHfb1SaIoXw4=;
        b=t6tcn+dwxEZ3DMcHMwEM1D7V3Acv7JUUl3AP8K/w9yRWsMb8h5OBKbgFWjQOupDVds
         bmEebHYqbRzbcAYLbGfO2wKe3DFsQqOHc9n1+ocJHNBUsywwMApSuLB9NqVj1uB5mJP4
         /2AyAzDdXUAs9vECa7OEhlca02ySFYP0g2hukBz/5voNs10Zcr/nHeuWmTcUahT45Vmo
         blO4IotA3VdP1BW8Tj6eNW/5bJKf2rHslyWudlnwydAsD8JzSnoj6xHVgCJR2lsaEr/7
         0ySk5D5jfPiktygTCwMQQJ0uQOiVPDOKY99AsZuMBIUQhKhp3UDf1aKacCgqTXJ0xCOt
         zsQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398600; x=1795003400;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GV/jfsFbMmkXTAQ4EO3mdq+1dYga/vXLHfb1SaIoXw4=;
        b=hbiJMULjSTREB1UU2M5qMsF3NeW/5Wyh64Z215/+avWeAF720pVRmKcznEY2aYaKul
         jNTOLnNltRx7P54SnmWuzU2hUch9sW8K0VKzWYPdtiB1zIScPfCRJ2JRABWt5yQeLBUR
         bFkeGHGombR7/2wiJgyw3sYmqikCXMFesJrLRUoJrMEn4J1hAIvvbw7a+rt2kprVB4zL
         CjFslu6cKFBgFBJtubHB3RRPM2pX/ZV7vhGdA9vhSv5gS18lh+idvZYI3STO7T2JtSIH
         qTtTYVXnXfcSx44mZYlmUOnFyi6ba1SiiWsSsCSSdhGqtpvnAYmTKysC+94Rb5pCZblD
         YovQ==
X-Forwarded-Encrypted: i=1; AL+hErEc6SZTpolsICyI3mfTlnTQdCf71jT3kryC4O0YcoSbF0v76KlWeSrbqS5dQuUGswWS1wlrU1ZKRlHmVBGkv4hU@lists.infradead.org
X-Gm-Message-State: APuU4Z+2XGDhXOSV1dwgqb8VAXfC/YtOnYbRT9bF52AeFsQvInHMut5f
	V95OSM8AsDKzIA647MUuTMsdzOIw6kEeILzE5wyciWAa8fjVR3zRksJB
X-Gm-Gg: AYBFou3wS0Qs43+v0zjZWmDPGY8nqqm03ooNfygmVYFIP/1hwtWGJeSTCJfExDCZqFS
	GJ+KPmZSwgEv95TTghl65Ak31NONIA27BMcsp/k+zahT8OR8EmHW+dEPQmSbgu5LCSB/zIEH4M1
	UY/8A6o1s1ORgM3o/G/jIG2mQ/CJ6vRF6bvq8OSxPpKMbyGDKeZD3DvMSesLXJmaADEkkOrga3c
	zBjRsSaARL9/JpU9+5VRXdGNft7MHySeqy4L5Y7ITPn4tGxonRy/2g/cwZs7aiNrVG2+5uQ8y7G
	Slz8/gTPwqpJT9oEO+Bp+gCejFqBawHiM88IOqAz/Zb1eSq+xNmDnGcxcO9LReSLfXuQEkFSt5T
	tnCMwfwQDatVLIbX/S8gKiwTLkduLVfK8iv+WUrJVPdxljLj4q1Fuwo36FjCcpqP9QeVOekW0sp
	ti8voD/vVjgsMS0WBGJ1A1Mm2l1a4qI+cZCa2GzM36stEamPSx8c7xU4r59k4nxmEmaOl9ud3PW
	p0WMZEi0MJwQKnRoetdjcJNUP6sDv1BZzvd1I80tVtKR1xwFmx5sJObuItl8Vq0b3FJcj+eDxEn
	oWm7pOJCGjqUiSyxWMcAXDrp3Z6EdVKnqyYD4oSe9vxs6XYtBs9LsyiHFfNvUFeE3zkX90o0/Jo
	zxqmkvceA6Aq3etMv5zvAfvDRKVXV5uvJ2WnkxW7Ny0i8VyuEXYTlmDUqEt5nW5ctouMmXmRsjd
	c=
X-Received: by 2002:a05:690e:134c:b0:67c:33ba:4367 with SMTP id 956f58d0204a3-67c67fee82emr1588399d50.123.1794398599941;
        Wed, 11 Nov 2026 04:03:19 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c58a09074sm4389527d50.18.2026.11.11.04.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:03:19 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v3 2/3] arm64: dts: allwinner: add A733 SoC description
Date: Wed, 11 Nov 2026 09:02:35 -0300
Message-ID: <20261111120240.32497-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <7c0ee4e609db5979d2a6598f46f40896b4f47a57.1794227241.git.enzo.adriano.code@gmail.com>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com> <7c0ee4e609db5979d2a6598f46f40896b4f47a57.1794227241.git.enzo.adriano.code@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_040321_624587_4D14157E 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/9/26 23:45, Enzo Adriano wrote:
> Provide the SoC description needed for the Cubie A7S console, PMIC and
> microSD support.

Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Radxa Cubie A7Z

I tested the A733 SoC dtsi with the posted prerequisite series and a
local board DT.

UART0, R-I2C0/AXP318W, RTC, MMC0 at 3.3 V (hash-checked reads and
writes), eight CPUs, PSCI reboot/power-off and 20 CPU hotplug cycles
worked. GPIO interrupts worked on both edges for PB, PC, PD, PE, PG, PH,
PJ and PK.

MMC0 card-detect hotplug needed my separate A733 EINT-mux fix. PI is not
exposed on this board, and I haven't tested the R-PIO interrupts or the
A7S-specific DT patches.

I'll send the A7Z board DT as a separate series based on this one.

