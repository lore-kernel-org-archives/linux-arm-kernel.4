Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3749606B563
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kHl4Wi3M;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c15syWlD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5wNJJzk3hTiNr6RLY2D3wmDAEcehs+iUFvfGtxABCR4=; b=kHl4Wi3MIWjoFZ
	/neSDMDsDud1HL5/yTrx/hA1knnPkNIzyZHlJ0mG7ikVuBoA5yFEfp6425WaZbTupxwRl9WCaSyvr
	oQr++U+MAFQO2jip+JAAWqPW86k2/TuFVO2I5DPRtsksVKCxcYkXTWrfUw5w25zIVjeTD0gbfIM1k
	EUruw6XAiQ0TCN8+1pC6rJBqcLnQxEd1jwCAfpr5XNrN0Jsuu96fZd/sW4Kh9fMqLZucsbGfcw3jd
	68AMT/WQn4Xni/6xNzwtWMkJd2yltp+Otl5AsOFl1LKn0nEWwYGugz6uJG9R4gmmAfXHNori2WZs+
	NWB4tCOjPiXfvWaMhWUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfI9-0000000BLHk-3Z7R;
	Fri, 13 Nov 2026 00:37:21 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfI0-0000000BLEV-444c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:37:14 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so4529765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530231; x=1795135031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5wNJJzk3hTiNr6RLY2D3wmDAEcehs+iUFvfGtxABCR4=;
        b=c15syWlDi2+82SCQct9mQv4MDhoPtrkk+VNcPeBBUMga42snJVrsF2Ce7klyiAIoro
         hi4/ZCnuL1g+5xYESyb8+2SPqBKmyAze/aIZdJzHp746l1Q39gaCaNt31iJm/GEiFnTd
         Is1zzFUPiBxuxbidpwGH5j7+JHGfGvEUUW6beZMLpwoM4zbY+XcEHvWPqEdFPyWmWku8
         SAQrM6nG1uGI9rAG/D4bWS8DsOpt0g3Tq2FuDHLwS4y+eaQI191hQvY2tNCiH2nc8WRg
         F8p2y7cds+j/z3mpftcAkknvR4kqv/uGu8DXt8jtxJ/xKIq+wU8gO8qzHxznoqyQTII6
         oLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530231; x=1795135031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5wNJJzk3hTiNr6RLY2D3wmDAEcehs+iUFvfGtxABCR4=;
        b=B5H6SY568llesi4ofurq7qDQF+K3gl4fyBdIyDpkEZlwES01j+o458R1lACckEowgg
         61dPL2uTczieZqP8qfDJQ+MpBwr/v+BxtEe4qTdxPCAq1NMtleeXJFVBZSlvfrvcOzl1
         9Po00+EkAKSn3vM5ZgK+KDeR3DwDBLt38SvrJLmLfzLeR4FvE7DKESfCJufOBeqJ2am/
         yM1kneS2EB6VVe2Eoth9rlEgTWLF2JlQ3MOVfkeNcqk5TVl+aNHOAwGCS9h2ar1jXxyr
         dzP9o5kYkpMXWKVJe1Jaz3Y1N7wYQnlFKPddo8RlylVj47H0Y1jHxwdEQVKZQ6oInlWL
         YVQQ==
X-Gm-Message-State: APuU4Z+3QZO9YREYf90OEViyyMTvgRDrpJZqbhiKHJ3ugOuHkbuL2xW3
	eDW+xnartpOGHFPGJiaCebtNtS2AGRftTwaUiPsFRkaRnchsCbgLlYtj
X-Gm-Gg: AYBFou1RY1/CT0P8Rqd9eZx+MFIDWgQW18nKXtg7ahE6jdQy06amqlH8E06HRAgRqOu
	nMSlSqZxavBQfWMxyqbeH0UbnIiXbI5vC31C2hcDNExT7X6gwuy4al1IHhJ6rbzPo0LFhiXcCG4
	eIUo5odcs47Tq/SrkkBjsNDll2AFx1udomGyJThCRYkhfG/Z9VmAQrcDP20v50h10/EWDxK59tP
	ctBKfnr7ZaBC6Y89qMPQR0ZFCFCeRSbawvzrK+/oevqVnC9a1ETPpU8bj1+3B2njrUUDKzMabTF
	hmkA0gvbeWwb2+W7aeVz6OOah1KHyiKvFKRRhlsOq1qbIS6WG+UlQ/FDO9pXSRjPTPMVscvHqQX
	aeDig+Ye3gK/dsImYw27mq8K4LdprfySZci2za1VIeSEYDWs/iwN1iIKdEUWBfFzC6wty+AjbG8
	5Kd6sUvBkdWJ4cGMto5+LI5lhMWGQ7tnirxZFlZ+JoBR34cHraqtHT+slRuV5JLnNQhVKByqo7t
	IAvyQC2TqSKZFWcqqKbIBN76+AOBvj6CzlXF6RWeKWRggMhAWw1F2h4rZiYTqv9iCIlLoCK7np8
	5F81V6V3kKQysCSKj1loqbTV+I4T30SrtVeHWgQQFaEOPiJ1KYH4aYcriw0Twkts6/UDYoH68tm
	ObgpHLa4Gop2idk8zSUGPg3E/8oN94VCWg8GUZ8QJfCttZhvtZzaemmj6HthN31g2ffnzMKFshH
	Q0b4WIHnwhJWXGm+Nt
X-Received: by 2002:a05:600c:4e92:b0:4a1:acaa:9d4c with SMTP id 5b1f17b1804b1-4bb55a850d8mr18959695e9.25.1794530231396;
        Thu, 12 Nov 2026 16:37:11 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e1f9e5asm102305995e9.0.2026.11.12.16.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:10 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 24/24] ARM: dts: zte: Add ZTE ZXHN H3600 board
Date: Fri, 13 Nov 2026 00:37:10 +0000
Message-ID: <20261113003710.3666410-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <0386c1dc-5026-4c45-9679-cc6e76f58e36@lunn.ch>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-25-ghahramani.navid@gmail.com> <0386c1dc-5026-4c45-9679-cc6e76f58e36@lunn.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163713_026482_3A839F69 
X-CRM114-Status: GOOD (  10.49  )
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

Hi Andrew,

Andrew Lunn wrote:
> You have phy-mode == gmii. Such a PHY does not need a SERDES. We need
> a better understanding of what is actually used here.

Agreed. gmii is just what my driver has always used, I never measured
it. I answered in more detail in the PHY thread, 16/24. I still have to
find out what the link really is and will do that before I send the
networking patches again.

Best regards,
Navid

