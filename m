Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F2F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tofx2jwW;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZE/FpyqF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r1XVIRh3fQHS2h4Sz3Sym6iq1PD22XfOzca3/RkWwfE=; b=tofx2jwWUkwpUJ
	zoHnGUNigsMxHanzFmYNjFvBmx39AoNovrbapYK0UNxsbVY30JMQjwVQ2ppTL0E2WrPb2nkLrtZva
	xdQdGK+A8LucKspnFe8U4LHfd2nyazrTNS2DFLO9a/1N52vNmx9nboCb2W3Ck+pqCrYaNhLAmy6Sn
	r8rcDevmrxZObhwiLxDWO+EJLB52+bMTakVcN7uQfy30p9FTUynMh86eGTEc6U4VxHnZdAgXwm0iP
	vtZNZlKxIc76wZvwabVh3pjFtYITxHGb46RijkTp3afV8qR1OuEpZ3RslF4C4rlRraI81j29kHW/s
	WSKs4x0xjHoqyFHs6SPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgAI-0000000ETFb-43PG;
	Thu, 26 Nov 2026 20:33:58 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgAF-0000000ETEY-1lr7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 20:33:56 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-4cde045b023so508926fac.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725234; x=1796330034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r1XVIRh3fQHS2h4Sz3Sym6iq1PD22XfOzca3/RkWwfE=;
        b=ZE/FpyqFejCwQzwlGxSEuUClqjUCdYrkzXQl2ERLtqkA0FVqNnBPyAcmC1EQNHyesN
         czleeLaT9CYt7pthCunNTsdaItB+ifRa0dlbR3qDtttAIAGBDxU+NxDnACDYC3NrN+uQ
         ZzJSxdgMBlkE9AkY6JK+HK1PohV+YSsSXQcau2gkEq+VPquRnwQmnDB0FeyZtWJcBzKl
         tUpYCWoQ9XqlwtZNmwnrRtM1RDSiTXy93rNAsF4R7F3I/lww7anYyn0fvlu5wFBeQNHK
         9jMRyxflLdVeD4tHUBnP9yCBlL18JHShhA+lifTjMKdkurYWOHOVnbWc7K2fnn+V3rvI
         1arQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725234; x=1796330034;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1XVIRh3fQHS2h4Sz3Sym6iq1PD22XfOzca3/RkWwfE=;
        b=ZaCR64aitwlZz92wn9ts62Z9WsNAAwIKsdjlzxNa3teqVaXP/HZIIepUjYIGRu7Ldz
         OY3h+GMy3yGQ/yFwPP1qCpLAUuAZ2E/BYH1iIHZHTqzq0cmSr/Qm7hNFCb3crldqCApB
         MO8UG7cBLqhHwtN8C0vlaq0uD7Wc11jdDxnEXK0A8XCy/rt3CHH0nM+hsKd7qoyLr7oG
         wM1dQ8d2p06ov6yszV8vDcVlzfYACkl6UFTmuq0XTQGD4eQGNRWZp6iGMi6ARr3rwaE+
         QlZVAE515L4+VxfCKRtbUIMotg/bqK/+QxehIVjBM4UsMoEoJhcbwZfWwCrqOveJuemT
         fIoA==
X-Forwarded-Encrypted: i=1; AL+hErFt2flFInHTcPLUg13Y6AwbAHwVJbTBwtcpvDyZyicRDJiuj8ONNR0bSKtUK4sEk/Rs2MftoF5vJhFbX0xlxFZJ@lists.infradead.org
X-Gm-Message-State: APuU4Z/GKApryEuAnJhkbwsrZIF21GP1MTnyCTiNDpYQg/44fCHkx862
	kRKlMvXZDyq4bpf3UdhnkzZvFA+FzZhS1wOHmfTBgVc+szu8wsealCod
X-Gm-Gg: AZFdTZcSoWd2O5+orIhv5ZEKCWvrmGO4IN/OA5axmz0iDxoiXybUXVNLUWab2XlEfek
	COCyHDp9YepDOtOBUnboNxLvbhBA3mar01zn4rlrYjx31VjX8lD+r4jB5FapCnTOppqERHm4yIk
	ewDqs9zNH30ehuJeuwhO//a1NmM2Ky95AO5uizoTRK4Tkd52FExzKx7k3eKzbybhQ/r/x5ujnHQ
	n9qG/LVlvFcRR+YBSF7I6izI6SmMR1GdVymSnTZWfC/XSIbW/cpwqlxsv79eRcXpiaiFC0Y97Ri
	IE+YOw/7inRuwOxrYf/G1e2ieO/MeGmF7oygxdyo+Mk6C3/VfI+HvfBzr12pm+vECzu33GTDr/0
	90mnmt1x+XpkRxAwRVtv3lr87PrS8BC2lrHoz/5f08Mp8VxD1q2ZmDz82Oll8hrOmWZvypWR/uJ
	72VUOVZH+RPiqNVmnHS2PmeSl6wfZqgUI/1Wj3rf7JAO3GzghwvhO9OqopYRSAVb4rDRRdHTJSZ
	k2gEiaX/ygVbUvq+K58RcPyjv9EqKa2dHyItRserspDZsDUANbVYC6R81SMQL5OxFAz1g7KvL76
	ZfhlRrQ9xOlJ40JTenF6Cqtg/CDGSjPhaXsFXZKOuvdQ3bY7YtoulxuCbMCKP5yge54OXy56WQr
	8eFw73ts=
X-Received: by 2002:a05:6808:4fd4:b0:55c:859:adc with SMTP id 5614622812f47-57a0c5bfaaamr27052957b6e.55.1795725234464;
        Thu, 26 Nov 2026 12:33:54 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a31929223sm17049002b6e.1.2026.11.26.12.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:33:54 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	wens@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
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
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v5 2/3] arm64: dts: allwinner: add A733 SoC description
Date: Thu, 26 Nov 2026 15:33:52 -0500
Message-ID: <20261125-a733-02-soc@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <0e94af87-71d1-4a5c-a2bb-218a2306db27@arm.com>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com> <20261121-a733-cubie-a7s-dt-v5-2@gmail.com> <CAGb2v64c5oirvfq7R3a1CWQCydfOOipcRD7dhSFAb=zczRdTHw@mail.gmail.com> <0e94af87-71d1-4a5c-a2bb-218a2306db27@arm.com>
Content-Type: text/plain; charset="us-ascii"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_123355_488362_4222A043 
X-CRM114-Status: GOOD (  12.47  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> > This should be evident from the schematic itself (the pins are used for
> > I2C). And then the datasheet would tell you which mux value it is.

A7S schematic sheets 7 and 16 show PG8/PG9 going to the EEPROM.
A733 Datasheet section 4.2.6, table 4-36 gives function 6 for TWI0
SCK/SDA. The v6 commit message cites both. In v6 the I2C0 group has
/omit-if-no-ref/ and the RTC clock include follows the A733 clock headers.

> > Someone please test the PMU.

On the A7S with v4 I pinned perf to each of CPUs 0-7. Cycles and
instructions counted on all eight. Sampling cycles at period 100000
delivered 193 or 194 samples per CPU, all on the requested CPU. Its
PPI 7 interrupt count increased by exactly the number of samples.
The two PMU nodes and their interrupt partitions are unchanged through v6.
Norman also verified PMU counting and overflow interrupts on all eight
CPUs on his A7S with v5 [3].
Vinicius also reports PMU counting and overflow interrupts on both
core types on his A7Z v1.11 [1].

> So I wonder if you could take just that binding patch already, to not
> block progress here?

The binding is Vinicius's v2 3/4 [2]. It adds the A733 compatible with
the DW APB UART fallback and has Conor's ack. Taking it separately
would cover the DT dependency. My console tests also used Vinicius's
driver changes.

[1] https://lore.kernel.org/r/20261125124139.23869-1-vinicius.eduardo.pedrosa@gmail.com
[2] https://lore.kernel.org/r/09f3a181436e6f19317224e583c2fdaa787797d7.1792439398.git.vinicius.eduardo.pedrosa@gmail.com
[3] https://lore.kernel.org/r/CqGMQaDysL6l016qtEM8oOEnYUMKACgmwLUbb0wruVAzPcwiqrz00WCOhTrhkVEaZt1YB3xfucXdEc-ZFi-sCPgn69RNqtW0v4Gn_HjQZXs=@proton.me

Thanks,
Enzo

