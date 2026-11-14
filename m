Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D7C606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=llgbs0MG;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=X6Y5yZgW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SJl0hUkZqXVApHX3JrLhyWzcJTsIXQcZFhtyiqalu2o=; b=llgbs0MGo3nQ2U
	8HFlqA2OFpb7MBaW182wFKAZgkvmtDxqxZU/+ym85Zn0tjpeDU5JoWwo8+Bmp2WLEec7/HgcT8U/M
	7CxogwzK+bLcLkfd8Iz4a23n+rpl74uke3GNRLY0OmoI13YVCye7lXPbXu+TY1O4Nq+0hqHy844pH
	cj6UsMfynHSjxHYkP57I7mK0TZd3CTPO0TNz+eMdNdtTX3Tw9zvS6yPIakmmmRnTxXBFvJ9sV9Rvw
	BdcgrJIJkoFFVqw/Cw0EmLxF9AmQt3VVHSNR6tZNO4mTuudAqMWe5VJoId5C6bpPvK5qVrhokTABD
	6id+5OtTFGrG1wh4mN+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4iS-0000000FJDD-3CNo;
	Sat, 14 Nov 2026 03:46:12 +0000
Received: from mail-pf1-x462.google.com ([2607:f8b0:4864:20::462])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4iN-0000000FJBu-44i9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:46:09 +0000
Received: by mail-pf1-x462.google.com with SMTP id d2e1a72fcca58-8a07078200fso759043b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:46:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627967; x=1795232767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SJl0hUkZqXVApHX3JrLhyWzcJTsIXQcZFhtyiqalu2o=;
        b=jWW84LouYF0Fx0GBDUkISv7trLUdWUBYsl2M99Yx0q5S+OLQaFnO8S0fvrqGjGZCWU
         ksLcGGKz82LTrdiGZEb1PJchUD9WVuR1UUBFO5sAxUTqEONXlIbHfvTwfXl5GVNEhAT4
         kS/XhRh3ukR85OXUWohqKL4XO1g8rn4iJY0znI0XIUGn1T/Bqz5NJtrBvTihhVEikxbK
         ZfM4SenbmJLaYtG1xwGE4+WfxhQSfcS/CbDMZSLCeQjl12dNtIRJZ+G++BtaMQdsEgxA
         dEqkKn+Od58ZhzqSyXylrQk6WaoxLMuzYnDuSOUi9rfVNZ0uk96w85i5gyJgvCrOyjNn
         cwkA==
X-Forwarded-Encrypted: i=1; AL+hErEuFQMvCP/yZAsEix1NlKdJHdlH6QFwEk4vdkjcBlKwUt8ltivBg2Uuk8QXpCcC3tav6hTLtug+O5DCnzcs3AiE@lists.infradead.org
X-Gm-Message-State: APuU4Z9tDCnhmt5Wb0wcllih7hqZjTiAhrHAGT5YoDkf4SQvWSomwMTZ
	ifVKYk50Q0VNiiFJJEq9C0j89KMFLSp4/2DbJsiYwoeJTwnD2hdOAwgJ3TH5++qTusNJGdlAfz6
	lwID9AyrdE7prrCKTlGSlrg4UTJs5G7zCgCTUP+CUp+nUZ2frjPgyYZW/Ot7plh7WqR4yuBKVu6
	ZISm4tFo6dt5HH8QeD1CfbUQWG+hQKlpa5vAn2Q4zQ1lay3CWUOtfa3GPaWj3ZlpkzC82jtqoJ3
	oa5FdaSQjLihC7Q77lgW/9XHPEAtgA6pYg=
X-Gm-Gg: AYBFou1/BpvyC6mFyVmIdCSmf1j+8XFexxkHfr5Z5V3pYIHvCnngXzNnv00iAq4Fjmb
	7qzb8qG7ujVZpjwOuD2I/1WnSAIo+TxhtMEWdUVw+dfSNvZG/TmPcNHI8pZ6tlo90etLikh6ctf
	tTAagelquR3GIjxa7yIEzLHDblwypx7Rx/NFNVCoW18pv9+QBd/AnMu4va9UjB6TlhPVVAMtwzc
	bSA8baJL9xz8Kqo+pIXFO2FCaTFy0/cTzR4B3p2fGkvFRYIwlscErxcQJLTIN0XfzVK9607g/j0
	5//VATULs4j8/YvoMwE34+rztdb4h8Nd4fcO9tDUnJP6sM6uahpw2q9L5PE/Kpee7mVUOijm1me
	L8QTOaVFJETbGSzA0gcHPixgxI/GMaWzWLMimAw1K6598liFu7CVY2POTIMhW+9iJ
X-Received: by 2002:a05:6a20:748a:b0:3e2:a07b:f383 with SMTP id adf61e73a8af0-3f7a9fec163mr4334956637.70.1794627966737;
        Fri, 13 Nov 2026 19:46:06 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cddc160b0f1sm138634a12.3.2026.11.13.19.46.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:46:06 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91256a7b7b3so29624246d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627964; x=1795232764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJl0hUkZqXVApHX3JrLhyWzcJTsIXQcZFhtyiqalu2o=;
        b=X6Y5yZgWwOeaiMg9wzSG7BEm4+bjjTM9usDufmu8stcMI5Je8V/QCnZg/Hp3gJb4ZN
         bsR4rxeABRNyu4Q7sVs+PNgNNSMzY9S5Xv2hnRy+HYsM7KNOZp6yuBRxSF10B4fs+mt2
         lUZDtu4HZOHrlQRiF2vS3LOhpSG4QUmvF+k/U=
X-Forwarded-Encrypted: i=1; AL+hErFP5yxZXHO5j6RspPaFJykQJlzpWck+6yN0FKqa/bhxjIRPYITdDafqE5A/6LYMvri9DG/PxQ6NUeSlqWbBuKlX@lists.infradead.org
X-Received: by 2002:ad4:5961:0:b0:91e:9074:19da with SMTP id 6a1803df08f44-91f241b8f9bmr70687726d6.22.1794627964210;
        Fri, 13 Nov 2026 19:46:04 -0800 (PST)
X-Received: by 2002:ad4:5961:0:b0:91e:9074:19da with SMTP id 6a1803df08f44-91f241b8f9bmr70687556d6.22.1794627963833;
        Fri, 13 Nov 2026 19:46:03 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d453casm34694466d6.10.2026.11.13.19.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:46:03 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/2] Broadcom maintainers fixes for 7.4
Date: Fri, 13 Nov 2026 19:45:50 -0800
Message-ID: <20261114034550.878760-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114034550.878760-1-florian.fainelli@broadcom.com>
References: <20261114034550.878760-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_194608_111784_2EABAF68 
X-CRM114-Status: UNSURE (   9.20  )
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb:

  Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.4/maintainers-fixes

for you to fetch changes up to f172beb64c26e2f4f3a1e7e92e6e710241a29c1e:

  MAINTAINERS: fix bouncing {sbranden,rjui}@broadcom.com (2026-11-13 10:18:38 -0800)

----------------------------------------------------------------
This pull request contains MAINTAINERS file updates for Broadcom SoCs,
please pull the following:

- Jiri corrects Ray and Scott's addresses to use the current format
  since the older format has stopped working

----------------------------------------------------------------
Jiri Slaby (1):
      MAINTAINERS: fix bouncing {sbranden,rjui}@broadcom.com

 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

